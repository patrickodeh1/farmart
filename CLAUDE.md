# Rezgo Connector Plugin — Developer Reference
> ALL changes inside platform/plugins/rezgo-plugin/ only — never touch core Farmart.
> Use sed/python for surgical changes. Never rewrite whole files unless no alternative.

---

## Status as of 2026-05-24

- Calendar widget loads and shows marked-up prices ✅
- Import as draft extracts correct price ✅
- Images upload correctly ✅
- Markup type + value saves correctly (fetch POST, not form submit) ✅
- Saving markup updates ec_products.price immediately ✅
- Gate price integration commented out (pending client DB schema) ✅
- Admin nav: "External DB Settings" (was "Gate Price Settings") ✅
- Child price shows $0.00 (not available) instead of hiding ✅
- rezgo_meta saving on order placed ✅
- Add to cart blocked without date selection (toast error) ✅
- Add to cart price correct — DB-write strategy working ✅
- Cart qty shows total tickets ✅
- Checkout price correct ✅
- Recently viewed cart item has no image key → checkout crashes ❌ (see below)
- Buy Now price — not fully verified ❌
- recently_viewed instance interfering with checkout ❌

---

## How We Work — IMPORTANT READ FIRST

**Tools used in this session:**
- `sed -n 'X,Yp' file` — read exact lines before any change
- `grep -n "pattern" file` — find line numbers
- `python3 << 'EOF' ... EOF` — complex replacements (avoids shell quoting hell)
- `docker-compose exec app php artisan tinker --execute="..."` — DB checks
- `docker-compose exec app tail -N storage/logs/laravel-YYYY-MM-DD.log` — server logs
- Browser DevTools Console + Network tab — JS debugging

**Workflow for every change:**
1. Read exact lines first: `sed -n 'X,Yp' file`
2. grep for exact string before replacing
3. For complex replacements use Python `content.find()` + `content.replace()`
4. Verify after: grep or sed -n to confirm it landed
5. Add temporary `\Log::info()` to confirm code paths, remove immediately after
6. Never rewrite whole files — only touch the exact lines needed

**Key debugging pattern used:**
Add backtrace to log: `$trace = collect(debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 8))->map(fn($f) => ($f['class'] ?? '').'::'.($f['function'] ?? '').':'.($f['line'] ?? ''))->implode(' | ');`
This revealed exactly which Farmart code path was overwriting our prices.

---

## Environment

```
Local dev:   /home/soarer/Projects/new/farmart
Production:  173.212.248.146 → /opt/apps/Farmart/main → container: main-app-1
DB:          farmart (MySQL)
PHP:         8.2
Theme:       farmart
Logs:        storage/logs/laravel-YYYY-MM-DD.log
             storage/logs/rezgo-sync-YYYY-MM-DD.log
```

**cURL timeouts in local dev** — Docker DNS issue only. Not a code problem.
`cURL error 6: Could not resolve host` / `cURL error 28: Connection timed out`
Production works fine. Ignore these in local logs.

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
│   │   ├── external-sync-settings.blade.php  ← was "Gate Price Settings"
│   │   ├── product-mappings.blade.php
│   │   ├── settings.blade.php
│   │   ├── submission-detail.blade.php
│   │   ├── submissions.blade.php
│   │   └── submit-order.blade.php
│   └── components/
│       ├── rezgo-calendar-widget.blade.php   ← ACTIVE
│       ├── rezgo-calendar.blade.php          ← OLD, unused, ignore
│       └── product-markup-box.blade.php      ← injected into product edit page
├── routes/web.php
└── src/
    ├── Http/Controllers/
    │   ├── RezgoConnectorController.php
    │   └── RezgoPricingApiController.php
    ├── Models/
    │   └── RezgoProductMapping.php (+ RezgoLog, RezgoSetting, RezgoSubmission)
    ├── Providers/
    │   └── RezgoConnectorServiceProvider.php  ← most hooks live here
    └── Services/
        ├── ExternalDatabaseSyncService.php
        ├── RezgoApiService.php
        └── (RezgoSettingsService, RezgoLoggerService, ExternalDatabaseConfigService)
```

---

## Rezgo API — Confirmed Behaviour

**Base URL:** `https://api.rezgo.com/xml`
All calls: GET with `transcode=CID&key=APIKEY&i=INSTRUCTION&...`

| Instruction | Purpose |
|-------------|---------|
| `i=company` | Company info / connection test |
| `i=search&t=uid&q=UID` | Item metadata (no price for variable tours) |
| `i=search&t=uid&q=UID&d=YYYY-MM-DD` | Date-specific pricing |
| `i=month&q=UID&d=YYYY-MM` | Monthly availability (day numbers only, no price) |
| `i=commit` | Submit booking |

**Price flow:** `fetchMonthAvailability()` → available day numbers → `fetchPriceForDate()` per day → `applyMarkupAndGatePrice()` → returned to calendar JS.

---

## Pricing Formula

```
rezgo_price   = wholesale from Rezgo API
marked_up     = rezgo_price * (1 + markup_value/100)   [percent]
              = rezgo_price + markup_value               [fixed]
final         = max(marked_up, rezgo_price + 0.01)
child_price   = 0 if Rezgo returns 0 — do NOT floor to 0.01
```

Gate price ceiling commented out — see `RezgoPricingApiController::applyMarkupAndGatePrice()`.
Pending from client: table name, UID column, price column confirmation, per-date vs static.

---

## Cart Price Override — HOW IT WORKS (hard-won knowledge)

### The Problem
Farmart reads product price from DB in every code path:
- `ProductPrice::getPrice()` → `apply_filters('product_prices_price_value', $price, $product)`
- `HandleApplyProductCrossSaleService` → re-adds all cart items at `$product->front_sale_price` from DB
- `Cart::refresh()` → re-adds all cart items at DB price
- `OrderHelper::handleAddCart()` → `Cart::add(..., $product->price()->getPrice(false), ...)`

In-memory property overrides (`$product->price = X`) are ignored by all of these.

### The Solution (currently implemented)
In `ecommerce_before_add_to_cart` hook, **temporarily write the Rezgo total to `ec_products.price` in the DB** before cart processing, then restore the original markup price via `app()->terminating()`.

```php
$originalPrice = Product::where('id', $productId)->value('price');
Product::where('id', $productId)->update(['price' => $roundedBlended, 'sale_price' => null]);
app()->terminating(function () use ($productId, $originalPrice) {
    Product::where('id', $productId)->update(['price' => $originalPrice]);
});
```

**Widget sends:**
- `extras[rezgo_total]` = grandTotal (adult_qty × adult_price + child_qty × child_price)
- `extras[rezgo_blended_price]` = grandTotal / totalTickets (per-ticket average)
- `qty` = adult_qty + child_qty (total tickets)
- Hook uses blended price so Farmart's `price × qty = grandTotal` exactly

### The filter (also registered, secondary defence)
`add_filter('product_prices_price_value', ...)` — returns `rezgo_total` when present in request,
or reads `extras['rezgo_total']` from cart item session for refresh calls.

### Key files that read price from DB (do not modify these):
```
platform/plugins/ecommerce/src/ValueObjects/ProductPrice.php  line 39
platform/plugins/ecommerce/src/Supports/OrderHelper.php       line 573
platform/plugins/ecommerce/src/Cart/Cart.php                  line 686 (refresh)
platform/plugins/ecommerce/src/Services/HandleApplyProductCrossSaleService.php
```

---

## CURRENT BLOCKERS (fix these next)

### 1. ❌ Checkout crashes: `Undefined array key "image"`
**File:** `platform/plugins/ecommerce/src/Supports/OrderHelper.php` line 872
**Cause:** `$cartItem->options['image']` — cart items from the `recently_viewed` instance
have empty options (no `image` key). `EcommerceHelper::handleCustomerRecentlyViewedProduct()`
adds products to `Cart::instance('recently_viewed')` with no options when a product page
is visited. This instance bleeds into checkout processing.

**Fix options:**
A) In our `ecommerce_before_add_to_cart` hook, also handle the recently_viewed instance
   to ensure it has an image key.
B) In `RezgoConnectorServiceProvider`, listen on the filter/action that builds cart items
   for checkout and skip recently_viewed items.
C) Check if `OrderHelper` filters by cart instance — if not, it may be a Farmart bug
   where recently_viewed items shouldn't be in the checkout loop at all.

**Investigate first:**
```bash
grep -n "recently_viewed\|instance.*cart\|getContent" platform/plugins/ecommerce/src/Supports/OrderHelper.php | head -20
sed -n '850,875p' platform/plugins/ecommerce/src/Supports/OrderHelper.php
```

### 2. ❌ recently_viewed instance adds item to cart on product page visit
`EcommerceHelper::handleCustomerRecentlyViewedProduct()` (line 718 of EcommerceHelper.php)
adds to `Cart::instance('recently_viewed')` — separate from main cart, harmless for cart
display. BUT it triggers our `product_prices_price_value` filter with null rezgo_total,
and the item ends up in checkout processing (causing the image crash above).
Fix this by fixing issue 1 — they're the same root cause.

### 3. ❌ Buy Now price — not fully verified
Buy Now sends `checkout=1` which triggers `Cart::refresh()` after add.
The DB-write strategy should handle it but needs testing after fix 1 is resolved.

---

## Markup Box (product-markup-box.blade.php)

**Critical:** Uses `fetch()` POST, NOT a `<form>` submit.
Reason: markup box is injected via `BASE_ACTION_META_BOXES` into Botble's product edit page
which already has a `<form>`. Nested forms = browser ignores inner form.
`rezgoSubmitMarkup(mappingId)` collects field values and POSTs via fetch to
`/admin/rezgo-connector/product-mappings`.

Wrapper div: `<div id="rezgo-markup-wrap-{id}">` — contains all hidden inputs.
Hidden input `rezgo_price_val` used by JS hint calculator.
Save button: `id="rezgo-save-btn-{id}"` — shows "Saving..." / "Saved!" feedback.

**On save:** `saveProductMapping()` updates `rezgo_product_mappings` AND immediately
recalculates and writes marked-up price to `ec_products.price` (in both update and
create branches of the method).

---

## Add to Cart — Block Without Date

In `ecommerce_before_add_to_cart` hook (ServiceProvider):
```php
$mapping = RezgoProductMapping::where('product_id', $product->id)->where('is_active', true)->first();
if ($mapping && empty($rezgoDate)) {
    throw new \Exception(__('Please select a tour date before adding to cart.'));
}
```
Farmart's `PublicCartController::store()` wraps `do_action('ecommerce_before_add_to_cart')`
in try/catch and returns the exception message as a toast error. ✅

---

## Widget — extras[] fields sent to cart

```
extras[rezgo_date]           selected date YYYY-MM-DD
extras[rezgo_uid]            Rezgo tour UID
extras[rezgo_price]          adult unit price (marked up)
extras[rezgo_child_price]    child unit price (0 if no child pricing)
extras[rezgo_adult_qty]      adult count
extras[rezgo_child_qty]      child count
extras[rezgo_total]          grandTotal = (adult×adult_price) + (child×child_price)
extras[rezgo_blended_price]  grandTotal / totalTickets (what we write to DB price)
qty                          adult_qty + child_qty (total tickets)
```

---

## Gate Price — Commented Out

`ExternalDatabaseSyncService` still injected in `RezgoPricingApiController` constructor.
Do NOT remove it. Gate price logic in `applyMarkupAndGatePrice()` is commented with
full restore instructions. Pending client schema confirmation.

---

## Database Tables

### `rezgo_product_mappings`
```
product_id, rezgo_uid, rezgo_title, rezgo_price (wholesale snapshot),
markup_type ('percent'|'fixed'), markup_value, is_active
```

### `rezgo_meta`
```
order_id, tour_uid, tour_date, passenger_count,
passenger_data JSON {adult_qty, child_qty, adult_price, child_price},
rezgo_booking_id (set after admin submits to Rezgo)
```

### `ec_order_product.options` (JSON)
Contains `extras` key with all Rezgo booking data.

---

## Known Decisions

| Topic | Decision |
|-------|----------|
| Payment | Manual approval — no payment_method in XML |
| Gate price | Commented out — pending client DB schema |
| Admin nav | "External DB Settings" (route stays `rezgo.gate-price.settings`) |
| Image upload | `RvMedia::uploadFromUrl($url, 0, 'products', 'image/jpeg')` |
| Calendar cache | 1 hour per uid+year+month |
| Child price | 0 when Rezgo returns 0 — shown as "$0.00 (not available)" |
| Markup save | fetch() POST — nested form issue |
| Cart price strategy | Temporary DB write + terminating restore |
| Cart qty | total tickets (adult+child), price = blended per-ticket |
| Add to cart block | Throws exception if no rezgo_date for mapped product |

## What's NOT Needed
- `rezgo-calendar.blade.php` — old file, unused
- `ExternalDatabaseConfigService::createTables()` — client's DB
- Gift card automation — manual approval