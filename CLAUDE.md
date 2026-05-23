# Rezgo Connector Plugin — Developer Reference
> Follow instructions exactly. Do not change files outside the plugin.
> Use sed/python for surgical changes — never rewrite whole files unless absolutely necessary.

---

## Status as of 2026-05-23 (end of session)

- Calendar widget loads and shows marked-up prices ✅
- Import as draft extracts correct price ✅
- Images upload correctly ✅
- Markup type + value saves correctly from product edit page ✅
- Saving markup updates ec_products.price immediately ✅
- Gate price integration commented out (pending client DB schema) ✅
- Admin nav renamed: "Gate Price Settings" → "External DB Settings" ✅
- Child price shows $0.00 (not available) instead of hiding ✅
- rezgo_meta saving on order placed ✅
- Cart/Buy Now price override — IN PROGRESS, not yet working ❌

---

## Environment

```
Local dev:   /home/soarer/Projects/new/farmart
Production:  173.212.248.146  →  /opt/apps/Farmart/main  →  container: main-app-1
DB:          farmart (MySQL)
PHP:         8.2
Theme:       farmart
Rule:        ALL changes inside platform/plugins/rezgo-plugin/ only — never touch core Farmart
```

---

## How We Work — Debugging Approach

**Always use sed/python for changes, never rewrite whole files.**

Workflow for any bug:
1. Read the exact lines first: `sed -n 'X,Yp' file`
2. grep for the exact string before sed-replacing it
3. Verify after every change: grep or sed -n to confirm the line landed
4. Add temporary `\Log::info()` to confirm code paths fire, remove immediately after
5. Use `docker-compose exec app php artisan tinker --execute="..."` for DB checks
6. Use browser DevTools Console + Network tab to debug JS issues
7. Use `docker-compose exec app tail -5 storage/logs/laravel-2026-05-23.log` for server logs

**Key lesson learned this session:** Botble admin forms are nested — our markup box
`<form>` was inside Botble's product edit `<form>`. Nested forms are illegal HTML —
browser ignores inner form and submits outer one. Fix: removed form tags, use `fetch()`
POST instead. Always check for nesting before adding forms to injected components.

**Key lesson learned this session:** `add_action('ecommerce_before_add_to_cart')`
fires but Farmart's `OrderHelper::handleAddCart()` calls `$product->price()->getPrice(false)`
which reads from `ProductPrice` value object, ignoring `$product->price` property override.
The filter `product_prices_price_value` exists but fires multiple times (promotions,
related products etc.) — unreliable for Cart::add(). See Cart Price Override section below.

---

## File Structure

```
platform/plugins/rezgo-plugin/
├── config/rezgo.php
├── database/migrations/
│   ├── 2024_03_11_000000_create_rezgo_tables.php
│   └── 2026_05_16_000000_add_markup_fields_to_rezgo_product_migrations.php
├── resources/views/
│   ├── admin/
│   │   ├── external-sync-settings.blade.php   ← was "Gate Price Settings", renamed
│   │   ├── logs.blade.php
│   │   ├── product-mappings.blade.php
│   │   ├── settings.blade.php
│   │   ├── submission-detail.blade.php
│   │   ├── submissions.blade.php
│   │   └── submit-order.blade.php
│   └── components/
│       ├── rezgo-calendar-widget.blade.php   ← ACTIVE
│       ├── rezgo-calendar.blade.php          ← OLD, unused, ignore it
│       └── product-markup-box.blade.php      ← injected into product edit page via BASE_ACTION_META_BOXES
├── routes/web.php
└── src/
    ├── Http/Controllers/
    │   ├── RezgoConnectorController.php
    │   └── RezgoPricingApiController.php
    ├── Models/
    │   ├── RezgoLog.php
    │   ├── RezgoProductMapping.php
    │   ├── RezgoSetting.php
    │   └── RezgoSubmission.php
    ├── Providers/
    │   └── RezgoConnectorServiceProvider.php
    └── Services/
        ├── ExternalDatabaseConfigService.php
        ├── ExternalDatabaseSyncService.php
        ├── RezgoApiService.php
        ├── RezgoLoggerService.php
        └── RezgoSettingsService.php
```

---

## Rezgo API — Confirmed Behaviour

### Base URL
https://api.rezgo.com/xml
All calls use GET with query params: `transcode=CID&key=APIKEY&i=INSTRUCTION&...`

### Instructions that exist and work
| Instruction | Purpose | Required params |
|-------------|---------|-----------------|
| `i=company` | Company info | — |
| `i=search` | Item summary OR date-specific pricing | `t=uid&q=UID` for summary; add `d=YYYY-MM-DD` for pricing |
| `i=month` | Monthly availability (which days are open) | `q=UID&d=YYYY-MM` |
| `i=commit` | Submit booking | POST XML body |
| `i=search_bookings` | Look up bookings | — |

### i=month — Monthly availability (NO price)
- `condition="a"` = available, `condition="u"` = unavailable
- `@value` on `<item>` = availability count (NOT price)

### i=search&d=YYYY-MM-DD — Price for a specific date
```xml
<date value="2026-06-01">
    <active>1</active>
    <availability>24</availability>
    <price_adult>150.00</price_adult>
    <price_child>120.00</price_child>
</date>
```

### cURL timeouts in local dev
`cURL error 6: Could not resolve host` and `cURL error 28: Connection timed out`
are Docker DNS issues in local dev only. Production works fine. Not a code problem.
If annoying locally, add `dns: ["8.8.8.8"]` to app service in docker-compose.yml.

---

## Pricing Formula (per calendar date)

```
rezgo_price   = wholesale price from Rezgo API (fetchPriceForDate)
marked_up     = rezgo_price + markup (% or fixed, per product in rezgo_product_mappings)
final         = max(marked_up, rezgo_price + 0.01)

child_price   = 0 if Rezgo returns 0 (tour has no child pricing) — do NOT floor to 0.01
```

Gate price ceiling is commented out pending client DB schema — see Gate Price section.

---

## Markup Box (product-markup-box.blade.php)

### How it works now
- Single `<div id="rezgo-markup-wrap-{id}">` wrapper (NOT a `<form>` — see why below)
- Hidden inputs inside the wrapper: `mapping_id`, `product_id`, `rezgo_uid`,
  `rezgo_title`, `passenger_type`, `rezgo_price_val`
- `rezgoSubmitMarkup(mappingId)` collects values and POSTs via `fetch()` to
  `/admin/rezgo-connector/product-mappings`
- Save button has `id="rezgo-save-btn-{id}"` — shows "Saving..." / "Saved!" feedback
- `rezgoUpdateHint()` recalculates sell price preview live as admin types

### Why fetch() not a form submit
The markup box is injected into the Botble product edit page via `BASE_ACTION_META_BOXES`.
Botble's product edit page already has its own `<form>`. Nested `<form>` tags are
illegal HTML — browser ignores the inner form and submits the outer one instead.
Result: clicking Save was saving the Botble product, not our markup. Fix: no `<form>`
tag at all, use `fetch()` POST which bypasses the nesting issue entirely.

### What happens on save (RezgoConnectorController::saveProductMapping)
1. Validates and updates `rezgo_product_mappings`
2. Immediately recalculates marked-up price and writes to `ec_products.price`:
   ```php
   $newPrice = $savedType === 'percent'
       ? round($rezgoPrice * (1 + $savedValue / 100), 2)
       : round($rezgoPrice + $savedValue, 2);
   Product::where('id', $mapping->product_id)->update(['price' => $newPrice]);
   ```
   This is in BOTH the update branch (after `$mapping->update()`) and the
   create/updateOrCreate branch (after `$mappingData = $mapping->toArray()`).

---

## Cart Price Override — CURRENT BLOCKER

### What should happen
Customer selects date + qty in calendar widget → widget computes grandTotal
= (adult_qty × adult_price) + (child_qty × child_price) → sends as `extras[rezgo_total]`
in the add-to-cart POST → cart shows that total.

### What actually happens
Cart shows `ec_products.price` (the static marked-up base price), not the
date-specific total the customer selected.

### Root cause (fully investigated)
`PublicCartController::store()` → `OrderHelper::handleAddCart()` →
`Cart::instance('cart')->add(..., $product->price()->getPrice(false), ...)`

`$product->price()` returns a `ProductPrice` value object. `getPrice()` reads
`$this->product->price` (the DB value) and passes it through
`apply_filters('product_prices_price_value', $price, $product)`.

The filter fires MULTIPLE times per request (for promotions, flash sales,
related products, etc.). Our filter hook is registered and fires with the correct
`rezgo_total` value — but it fires AFTER `Cart::add()` has already stored the
wrong price. The calls with `rezgo_total: null` happen first during promotion
checks, then `Cart::add()` uses that price, then our correct-value call fires too late.

### Confirmed facts
- `extras[rezgo_total]` IS in the POST payload (verified via DevTools Network tab)
- `add_action('ecommerce_before_add_to_cart')` fires but `$product->price` override
  is ignored — `getPrice()` reads the model's `price` attribute fresh each time
- `add_filter('product_prices_price_value')` IS registered and fires with correct
  value but too late (after Cart::add)
- `ecommerce_after_add_to_cart` filter does NOT exist in Farmart ecommerce plugin

### What to try next
`Cart::update($rowId, ['price' => $rezgoTotal])` can update a cart item price
after it's added. `CartItem::updateFromArray()` accepts `price` key.
The problem is finding the right moment to call it after `Cart::add()`.

**Option A:** Hook into a Farmart event/filter that fires after `handleAddCart()` returns.
Check: `grep -rn "do_action\|apply_filters\|event\|dispatch" platform/plugins/ecommerce/src/Http/Controllers/Fronts/PublicCartController.php`

**Option B:** Find what fires after `Cart::add()` in `OrderHelper::handleAddCart()`.
Check line 586: `return Cart::instance('cart')->content()->toArray();`
Then back in `PublicCartController` line 182: `$cartItems = OrderHelper::handleAddCart(...)`
— the `$cartItems` array is returned. If there's a filter on that return value, hook there
and update the price in the session.

**Option C:** Temporarily write `rezgo_total` to `ec_products.price` before the
add-to-cart request is processed, then restore it after. Messy but guaranteed to work.

**Option D:** Override the `ProductPrice` class or `getPrice()` via a service container
binding so it checks for a session/request value before returning the DB price.
Check: `grep -n "ProductPrice\|price()" platform/plugins/ecommerce/src/Models/Product.php`

### Key files to read for this fix
```
platform/plugins/ecommerce/src/Http/Controllers/Fronts/PublicCartController.php  line 182-185
platform/plugins/ecommerce/src/Supports/OrderHelper.php  lines 532-586
platform/plugins/ecommerce/src/ValueObjects/ProductPrice.php  lines 32-42
platform/plugins/ecommerce/src/Cart/Cart.php  lines 181-207 (update method)
platform/plugins/ecommerce/src/Cart/CartItem.php  lines 112-120 (updateFromArray)
```

---

## Widget — How extras[] reach the cart form

`rezgoFindCartForm()` finds the add-to-cart form:
- Primary: `form[data-bb-toggle="product-form"]` (not present on this theme)
- Secondary: `form[action*="cart"]` ← this is what matches
- There are TWO `form[action*="cart/add-to-cart"]` on the page: one in header,
  one next to Buy Now. `querySelector` finds the FIRST one (header). This may
  or may not be an issue — verify which one the customer actually submits.

`rezgoUpdateForm()` injects hidden inputs:
```
extras[rezgo_date]        selected date string
extras[rezgo_uid]         Rezgo tour UID
extras[rezgo_price]       adult unit price
extras[rezgo_child_price] child unit price (0 if no child pricing)
extras[rezgo_adult_qty]   adult count
extras[rezgo_child_qty]   child count
extras[rezgo_total]       grand total = (adult_qty × adult_price) + (child_qty × child_price)
```
qty input is forced to 1. Grand total is the single source of truth.

`rezgoUpdateTotalDisplay()` calls `rezgoUpdateForm()` on every qty change,
keeping all hidden inputs in sync.

---

## Gate Price — Commented Out

`ExternalDatabaseSyncService` is still injected in `RezgoPricingApiController`
constructor — do NOT remove it.

The gate price ceiling logic inside `applyMarkupAndGatePrice()` is commented out.
To re-enable when client provides schema:
- Table name (assumed: `ticket_prices` — unconfirmed)
- Price column (confirmed: `park_price`)
- UID column (assumed: `rezgo_uid` — unconfirmed)
- Whether pricing is per-date or static (unconfirmed)

---

## Key Files and What They Do

### `RezgoApiService.php`
- `fetchMonthAvailability(uid, year, month)` → `i=month` → available day numbers
- `fetchPriceForDate(uid, date)` → `i=search&d=DATE` → adult price float
- `getPricingForMonth(uid, year, month)` → combines above, caches 1hr
- `extractPrice(itemData, uid)` → starting field first, falls back to fetchPriceForDate

### `RezgoPricingApiController.php`
- `applyMarkupAndGatePrice()` → applies markup, gate price commented out
- Child price: returns 0 if Rezgo returns 0 (do not floor to 0.01)

### `RezgoConnectorController.php`
- `saveProductMapping()` → saves markup AND updates ec_products.price (both branches)
- `importAsDraft()` → creates product, mapping with 10% default markup

### `RezgoConnectorServiceProvider.php`
- `ecommerce_after_product_description` filter → injects calendar widget
- `BASE_ACTION_META_BOXES` action → injects markup box into product edit
- `add_action('ecommerce_before_add_to_cart')` → fires but can't override price (see above)
- `add_filter('product_prices_price_value')` → registered, fires too late (see above)
- `OrderPlacedEvent` listener → saves rezgo_meta

### `product-markup-box.blade.php`
- Uses fetch() not form submit — see Markup Box section above
- Wrapper div: `<div id="rezgo-markup-wrap-{id}">` closed explicitly
- Hidden input `rezgo_price_val` used by JS hint calculator

---

## Database Tables

### `rezgo_product_mappings`
```
product_id     FK to ec_products.id
rezgo_uid      Rezgo tour UID
rezgo_title    Tour name
rezgo_price    Wholesale price snapshot (static, used for markup hint display)
markup_type    'percent' or 'fixed'
markup_value   e.g. 10.00 for 10% or 5.00 for $5 fixed
is_active      boolean
```

### `rezgo_meta`
```
order_id        FK to ec_orders.id
tour_uid        Rezgo UID
tour_date       Date customer selected (YYYY-MM-DD)
passenger_count Total tickets
passenger_data  JSON {adult_qty, child_qty, adult_price, child_price}
rezgo_booking_id Set after admin submits to Rezgo
```

### `ec_order_product`
Field `options` (JSON) → `extras` key contains all Rezgo data:
`rezgo_date`, `rezgo_uid`, `rezgo_price`, `rezgo_child_price`,
`rezgo_adult_qty`, `rezgo_child_qty`, `rezgo_total`

---

## Pending Work (priority order)

### 1. ❌ Cart/Buy Now price override
See "Cart Price Override — CURRENT BLOCKER" section above.
This is the main remaining issue. Try Option A first (hook after handleAddCart returns).

### 2. Gate price re-enable
Waiting on client to confirm: table name, UID column name, whether per-date or static.
Everything is commented and documented in `RezgoPricingApiController::applyMarkupAndGatePrice()`.

### 3. Verify rezgo_meta saving end-to-end
Place a real test order, check: `SELECT * FROM rezgo_meta;`

### 4. Full end-to-end test
Import → publish → buy → verify rezgo_meta → Submit Order → verify Rezgo booking.

### 5. Performance — reduce calendar API calls
Each available day = one `i=search&d=DATE` call. Cached 1hr so acceptable for now.

---

## Environment Variables

```env
REZGO_CID=           # set via admin Settings page (stored encrypted)
REZGO_API_KEY=       # set via admin Settings page (stored encrypted)

REZGO_EXTERNAL_SYNC_ENABLED=false
DZM_COATAA_DB_HOST=
DZM_COATAA_DB_PORT=3306
DZM_COATAA_DB_USERNAME=
DZM_COATAA_DB_PASSWORD=
DZM_COATAA_DB_DATABASE=

QUEUE_CONNECTION=sync   # keep sync in dev
```

---

## What's NOT Needed

- Gift card payment method automation — client wants manual approval
- Rezgo payment method field in XML — already removed
- `rezgo-calendar.blade.php` — old file, unused, ignore it
- `AttachRezgoImagesToProduct.php` Job — replaced by inline method
- `ExternalDatabaseConfigService::createTables()` — client's DB, not ours

---

## Known Decisions

| Topic | Decision |
|-------|----------|
| Payment method | Manual approval — no payment_method in XML |
| Gate price | Commented out — pending client DB schema confirmation |
| Admin nav label | "External DB Settings" (was "Gate Price Settings") |
| Image upload | Inline via RvMedia::uploadFromUrl($url, 0, 'products', 'image/jpeg') |
| Calendar cache | 1 hour per uid+year+month key |
| Child price | Returns 0 when Rezgo returns 0 — shown as "$0.00 (not available)" in widget |
| Markup save | fetch() POST from markup box — NOT a form submit (nested form issue) |
| ec_products.price | Updated immediately when markup is saved |
| Cart price | UNSOLVED — extras[rezgo_total] reaches server but Farmart reads DB price |