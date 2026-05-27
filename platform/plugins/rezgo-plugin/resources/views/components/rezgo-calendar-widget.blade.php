@php
    $rezgoMapping = null;
    if (isset($product) && $product instanceof \Illuminate\Database\Eloquent\Model) {
        $rezgoMapping = \Botble\RezgoConnector\Models\RezgoProductMapping::where('product_id', $product->id)->first();
    }
    if (!$rezgoMapping || !$rezgoMapping->is_active) return;
    $rezgoUidSafe = e($rezgoMapping->rezgo_uid);
    $lowestPrice  = $rezgoMapping->rezgo_price ?? 0;
@endphp

{{-- ═══════════════════════════════════════════════════════════
     "As low as" banner + Select Date button — injected below
     the product description on the detail page.
     The full calendar lives inside the modal below.
═══════════════════════════════════════════════════════════ --}}

<div class="rezgo-cta-bar mt-3 mb-2">

    <button type="button" class="btn rezgo-select-date-btn" id="rezgo-open-modal">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" style="margin-right:6px;vertical-align:-2px"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
        Select Date
    </button>
</div>

{{-- ═══════════════════════════════════════════════════════════
     MODAL — Calendar + booking form
═══════════════════════════════════════════════════════════ --}}
<div id="rezgo-modal-overlay" class="rezgo-modal-overlay" role="dialog" aria-modal="true" aria-label="Select tour date">
    <div class="rezgo-modal-box">

        {{-- Header --}}
        <div class="rezgo-modal-header">
            <span class="rezgo-modal-title">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" style="margin-right:6px;vertical-align:-3px"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                Select a Date
            </span>
            <button type="button" class="rezgo-modal-close" id="rezgo-close-modal" aria-label="Close">&times;</button>
        </div>

        {{-- Body --}}
        <div class="rezgo-modal-body">

            {{-- Calendar --}}
            <div id="rezgo-tour-calendar" class="rezgo-calendar-container">
                <div class="rezgo-cal-loading py-2 text-center">
                    <span class="rezgo-spinner" role="status" aria-hidden="true"></span>
                    <span class="ms-2">Loading availability…</span>
                </div>
            </div>

            {{-- Booking details — shown after date selected --}}
            <div id="rezgo-selected-info" class="rezgo-selected-info mt-3" style="display:none;">
                <div id="rezgo-selected-date-display"></div>
            </div>

        </div>

        {{-- Footer --}}
        <div class="rezgo-modal-footer" id="rezgo-modal-footer" style="display:none;">
            <button type="button" class="btn rezgo-modal-cancel-btn" id="rezgo-cancel-selection">Clear</button>
            <button type="button" class="btn rezgo-modal-confirm-btn" id="rezgo-confirm-selection">Confirm Date</button>
        </div>

    </div>
</div>
<div id="rezgo-modal-backdrop" class="rezgo-modal-backdrop"></div>

<style>
/* ── CTA bar ── */
.rezgo-cta-bar{display:flex;align-items:center;gap:16px;flex-wrap:wrap;padding:14px 0;border-top:1px solid #eee;border-bottom:1px solid #eee;margin:16px 0}
.rezgo-as-low-as{display:flex;align-items:baseline;gap:6px;flex-wrap:wrap}
.rezgo-alp-label{font-size:13px;color:#777;font-weight:500}
.rezgo-alp-price{font-size:22px;font-weight:700;color:#1a1a2e;line-height:1}
.rezgo-alp-note{font-size:12px;color:#999}
.rezgo-select-date-btn{background:#ff6b35;color:#fff;font-weight:600;font-size:15px;padding:10px 24px;border-radius:8px;border:none;cursor:pointer;transition:background .15s,transform .1s;white-space:nowrap}
.rezgo-select-date-btn:hover{background:#e55a26;color:#fff;transform:translateY(-1px)}
.rezgo-select-date-btn:active{transform:translateY(0)}

/* ── Modal overlay ── */
.rezgo-modal-backdrop{display:none;position:fixed;inset:0;background:rgba(0,0,0,.5);z-index:9998;backdrop-filter:blur(2px)}
.rezgo-modal-overlay{display:none;position:fixed;inset:0;z-index:9999;align-items:center;justify-content:center;padding:16px}
.rezgo-modal-overlay.active{display:flex}
.rezgo-modal-backdrop.active{display:block}
.rezgo-modal-box{background:#fff;border-radius:16px;width:100%;max-width:540px;max-height:90vh;overflow-y:auto;box-shadow:0 20px 60px rgba(0,0,0,.25);animation:rezgoSlideIn .2s ease}
@keyframes rezgoSlideIn{from{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translateY(0)}}

/* ── Modal header ── */
.rezgo-modal-header{display:flex;justify-content:space-between;align-items:center;padding:18px 20px 14px;border-bottom:1px solid #eee}
.rezgo-modal-title{font-size:16px;font-weight:700;color:#1a1a2e}
.rezgo-modal-close{background:none;border:none;font-size:24px;line-height:1;color:#999;cursor:pointer;padding:0 4px;transition:color .15s}
.rezgo-modal-close:hover{color:#333}

/* ── Modal body ── */
.rezgo-modal-body{padding:16px 20px}

/* ── Modal footer ── */
.rezgo-modal-footer{display:flex;justify-content:flex-end;gap:10px;padding:14px 20px;border-top:1px solid #eee}
.rezgo-modal-cancel-btn{background:#f5f5f5;color:#555;border:none;padding:9px 20px;border-radius:7px;font-weight:500;cursor:pointer}
.rezgo-modal-cancel-btn:hover{background:#e5e5e5}
.rezgo-modal-confirm-btn{background:#ff6b35;color:#fff;border:none;padding:9px 24px;border-radius:7px;font-weight:600;cursor:pointer;transition:background .15s}
.rezgo-modal-confirm-btn:hover{background:#e55a26}

/* ── Calendar ── */
.rezgo-calendar-inline{border:1px solid #e5e5e5;border-radius:8px;padding:12px;background:#fafafa}
.rezgo-cal-header{display:flex;justify-content:space-between;align-items:center;margin-bottom:10px;padding-bottom:8px;border-bottom:1px solid #e5e5e5}
.rezgo-cal-header button{background:none;border:1px solid #ddd;border-radius:4px;padding:4px 12px;cursor:pointer;font-size:14px;transition:background .15s}
.rezgo-cal-header button:hover{background:#e5e5e5}
.rezgo-cal-table{width:100%;border-collapse:collapse}
.rezgo-cal-table th{font-size:11px;padding:4px 2px;text-align:center;color:#666;font-weight:500}
.rezgo-cal-table td{padding:2px;vertical-align:top}
.rezgo-cal-day{text-align:center;padding:4px 2px;cursor:default;position:relative;min-height:44px;border-radius:4px}
.rezgo-cal-day.other-month{color:#aaa;background:#f5f5f5;border-radius:4px}
.rezgo-cal-day.available{cursor:pointer;background:#fff;border:1px solid #e5e5e5;transition:background .15s,border-color .15s}
.rezgo-cal-day.available:hover{background:#fff4f0;border-color:#ff6b35}
.rezgo-cal-day.selected{background:#ff6b35!important;color:#fff;border-color:#ff6b35}
.rezgo-cal-day.unavailable{opacity:.5;background:#f0f0f0;border-radius:4px}
.rezgo-cal-date{font-size:12px;display:block;line-height:1.2;font-weight:500}
.rezgo-cal-price{font-size:9px;color:#ff6b35;display:block;margin-top:2px;font-weight:600}
.rezgo-cal-day.selected .rezgo-cal-price{color:rgba(255,255,255,.85)}
.rezgo-cal-loading{padding:20px;text-align:center;color:#666}
.rezgo-spinner{display:inline-block;width:1rem;height:1rem;border:.15em solid rgba(0,0,0,.1);border-left-color:#ff6b35;border-radius:50%;animation:spin 1s linear infinite;vertical-align:middle}
@keyframes spin{to{transform:rotate(360deg)}}

/* ── Booking summary inside modal ── */
.rezgo-selected-alert{background:#fff4f0;border:1px solid #ffd4c2;border-radius:8px;padding:12px 16px;color:#c0410a;margin-bottom:12px}
.rezgo-selected-alert-title{font-weight:600;margin-bottom:4px}
.rezgo-passenger-row{display:flex;align-items:center;justify-content:space-between;margin-bottom:12px;padding:8px 0;border-bottom:1px solid #eee}
.rezgo-passenger-row:last-child{border-bottom:none;margin-bottom:0}
.rezgo-passenger-label{flex:1}
.rezgo-passenger-name{font-weight:600;font-size:14px}
.rezgo-passenger-price{color:#666;font-size:12px}
.rezgo-qty-selector{display:flex;align-items:center;border:1px solid #ddd;border-radius:6px;overflow:hidden}
.rezgo-qty-selector button{background:#f8f9fa;border:none;width:36px;height:36px;cursor:pointer;font-size:18px;font-weight:500;color:#333;transition:background .15s}
.rezgo-qty-selector button:hover{background:#e9ecef}
.rezgo-qty-selector button:disabled{opacity:.4;cursor:not-allowed}
.rezgo-qty-selector input{width:50px;height:36px;border:none;border-left:1px solid #ddd;border-right:1px solid #ddd;text-align:center;font-size:14px;font-weight:600;-moz-appearance:textfield;appearance:none}
.rezgo-qty-selector input::-webkit-outer-spin-button,.rezgo-qty-selector input::-webkit-inner-spin-button{-webkit-appearance:none;margin:0}
.rezgo-booking-summary{background:#f8f9fa;border:1px solid #e5e5e5;border-radius:8px;padding:12px 16px;margin-top:12px}
.rezgo-booking-summary-row{display:flex;justify-content:space-between;align-items:center;padding:4px 0;font-size:14px}
.rezgo-booking-summary-total{font-size:18px;font-weight:700;color:#ff6b35}
</style>

<script>
(function(){
    const rezgoUid = '{{ $rezgoUidSafe }}';
    let rezgoCurrentYear  = new Date().getFullYear();
    let rezgoCurrentMonth = new Date().getMonth() + 1;
    let rezgoPricingData  = {};
    let rezgoSelectedDayEl   = null;
    let rezgoSelectedDate    = null;
    let rezgoSelectedPricing = null;
    let rezgoCalendarLoaded  = false;
    const REZGO_MAX_QTY = 20;
    const rezgoMonthNames = ['January','February','March','April','May','June','July','August','September','October','November','December'];

    // ── DOM refs ──
    const overlay    = document.getElementById('rezgo-modal-overlay');
    const backdrop   = document.getElementById('rezgo-modal-backdrop');
    const openBtn    = document.getElementById('rezgo-open-modal');
    const closeBtn   = document.getElementById('rezgo-close-modal');
    const confirmBtn = document.getElementById('rezgo-confirm-selection');
    const cancelBtn  = document.getElementById('rezgo-cancel-selection');
    const footer     = document.getElementById('rezgo-modal-footer');
    const calContainer       = document.getElementById('rezgo-tour-calendar');
    const selectedInfo       = document.getElementById('rezgo-selected-info');
    const selectedDateDisplay = document.getElementById('rezgo-selected-date-display');

    // ── Modal open/close ──
    function openModal() {
        overlay.classList.add('active');
        backdrop.classList.add('active');
        document.body.style.overflow = 'hidden';
        if (!rezgoCalendarLoaded) { rezgoInitCalendar(); rezgoCalendarLoaded = true; }
    }
    function closeModal() {
        overlay.classList.remove('active');
        backdrop.classList.remove('active');
        document.body.style.overflow = '';
    }
    if (openBtn)    openBtn.addEventListener('click', openModal);
    if (closeBtn)   closeBtn.addEventListener('click', closeModal);
    if (backdrop)   backdrop.addEventListener('click', closeModal);
    if (cancelBtn)  cancelBtn.addEventListener('click', function() {
        // clear selection
        if (rezgoSelectedDayEl) rezgoSelectedDayEl.classList.remove('selected');
        rezgoSelectedDayEl = rezgoSelectedDate = rezgoSelectedPricing = null;
        if (selectedInfo) selectedInfo.style.display = 'none';
        if (footer) footer.style.display = 'none';
    });
    if (confirmBtn) confirmBtn.addEventListener('click', function() {
        if (!rezgoSelectedDate) return;
        rezgoUpdateForm();
        // Update the "Select Date" button text to reflect chosen date
        if (openBtn) openBtn.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" style="margin-right:6px;vertical-align:-2px"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>' + rezgoSelectedDate + ' ✓';
        // Update "as low as" to show selected price
        const alpEl = document.getElementById('rezgo-as-low-as-price');
        if (alpEl && rezgoSelectedPricing) alpEl.textContent = '$' + (rezgoSelectedPricing.price_adult || 0).toFixed(2);
        closeModal();
    });
    // Esc key
    document.addEventListener('keydown', function(e) { if (e.key === 'Escape') closeModal(); });

    // ── Find cart form ──
    function rezgoFindCartForm() {
        var form = document.querySelector('form[data-bb-toggle="product-form"]');
        if (form) return form;
        form = document.querySelector('form[action*="cart"]');
        if (form) return form;
        var qtyInput = document.querySelector('form input[name="qty"]');
        if (qtyInput) return qtyInput.closest('form');
        form = document.querySelector('.product-detail form, .product-form form, form.add-to-cart');
        return form || null;
    }

    // ── Inject hidden inputs into cart form ──
    function rezgoUpdateForm() {
        var form = rezgoFindCartForm();
        if (!form || !rezgoSelectedDate || !rezgoSelectedPricing) return;
        function h(name) {
            var el = form.querySelector('input[name="' + name + '"]');
            if (!el) { el = document.createElement('input'); el.type = 'hidden'; el.name = name; form.appendChild(el); }
            return el;
        }
        var adultEl = document.getElementById('rezgo-qty-adult');
        var childEl = document.getElementById('rezgo-qty-child');
        var adultQty = adultEl ? Math.max(0, parseInt(adultEl.value || 0)) : 1;
        var childQty = childEl ? Math.max(0, parseInt(childEl.value || 0)) : 0;
        var adultPrice = rezgoSelectedPricing.price_adult || 0;
        var childPrice = rezgoSelectedPricing.price_child || 0;
        var grandTotal = (adultPrice * adultQty) + (childPrice * childQty);
        var totalTickets = adultQty + childQty;
        if (totalTickets < 1) totalTickets = 1;
        var blendedPrice = grandTotal / totalTickets;
        h('extras[rezgo_date]').value        = rezgoSelectedDate;
        h('extras[rezgo_uid]').value         = rezgoUid;
        h('extras[rezgo_price]').value       = adultPrice.toFixed(2);
        h('extras[rezgo_child_price]').value = childPrice.toFixed(2);
        h('extras[rezgo_adult_qty]').value   = adultQty;
        h('extras[rezgo_child_qty]').value   = childQty;
        h('extras[rezgo_total]').value       = grandTotal.toFixed(2);
        h('extras[rezgo_blended_price]').value = blendedPrice.toFixed(2);
        var qtyInput = form.querySelector('input[name="qty"]');
        if (qtyInput) qtyInput.value = totalTickets;
    }

    function rezgoUpdateTotalDisplay() {
        if (!rezgoSelectedPricing) return;
        var adultQty = parseInt(document.getElementById('rezgo-qty-adult')?.value) || 0;
        var childQty = parseInt(document.getElementById('rezgo-qty-child')?.value) || 0;
        var total = (rezgoSelectedPricing.price_adult || 0) * adultQty + (rezgoSelectedPricing.price_child || 0) * childQty;
        var totalEl = document.getElementById('rezgo-booking-total');
        if (totalEl) totalEl.textContent = '$' + total.toFixed(2);
        rezgoUpdateForm();
    }

    function rezgoSelectDate(date, pricing, el) {
        if (rezgoSelectedDayEl) rezgoSelectedDayEl.classList.remove('selected');
        rezgoSelectedDayEl = el; el.classList.add('selected');
        rezgoSelectedDate = date; rezgoSelectedPricing = pricing;
        if (selectedInfo) selectedInfo.style.display = 'block';
        if (footer) footer.style.display = 'flex';
        var hasChild = pricing.price_child > 0;
        var childDisabled = hasChild ? '' : ' disabled';
        var childMax = hasChild ? REZGO_MAX_QTY : 0;
        var childNote = hasChild ? '' : ' <span style="color:#aaa;font-size:11px">(not available)</span>';
        var html = '<div class="rezgo-selected-alert"><div class="rezgo-selected-alert-title">✓ ' + date + ' selected</div><div style="font-size:12px;opacity:.8">Adjust passengers below then confirm</div></div>';
        html += '<div class="rezgo-booking-summary">';
        html += '<div class="rezgo-booking-summary-row" style="border-bottom:1px solid #ddd;padding-bottom:8px;margin-bottom:8px;font-weight:600"><span>Passenger</span><span>Qty × Price</span></div>';
        html += '<div class="rezgo-passenger-row"><div class="rezgo-passenger-label"><div class="rezgo-passenger-name">Adult</div><div class="rezgo-passenger-price">$' + (pricing.price_adult || 0).toFixed(2) + ' per person</div></div><div class="rezgo-qty-selector"><button type="button" class="rezgo-qty-minus-adult">−</button><input type="number" id="rezgo-qty-adult" value="1" min="0" max="' + REZGO_MAX_QTY + '" readonly><button type="button" class="rezgo-qty-plus-adult">+</button></div></div>';
        html += '<div class="rezgo-passenger-row"><div class="rezgo-passenger-label"><div class="rezgo-passenger-name">Child</div><div class="rezgo-passenger-price">$' + (pricing.price_child || 0).toFixed(2) + ' per person' + childNote + '</div></div><div class="rezgo-qty-selector"><button type="button" class="rezgo-qty-minus-child"' + childDisabled + '>−</button><input type="number" id="rezgo-qty-child" value="0" min="0" max="' + childMax + '" readonly><button type="button" class="rezgo-qty-plus-child"' + childDisabled + '>+</button></div></div>';
        html += '<div class="rezgo-booking-summary-row" style="border-top:1px solid #ddd;padding-top:8px;margin-top:8px"><span class="rezgo-booking-summary-total">Total</span><span class="rezgo-booking-summary-total" id="rezgo-booking-total">$' + (pricing.price_adult || 0).toFixed(2) + '</span></div>';
        html += '</div>';
        if (selectedDateDisplay) selectedDateDisplay.innerHTML = html;
        rezgoBindQtyEvents();
        rezgoUpdateTotalDisplay();
    }

    function rezgoBindQtyEvents() {
        function bind(sel, type, delta) {
            var btn = document.querySelector(sel);
            if (!btn) return;
            btn.addEventListener('click', function() {
                var el = document.getElementById('rezgo-qty-' + type);
                if (!el) return;
                var max = parseInt(el.max) || REZGO_MAX_QTY;
                el.value = Math.min(max, Math.max(0, parseInt(el.value || 0) + delta));
                rezgoUpdateTotalDisplay();
            });
        }
        bind('.rezgo-qty-minus-adult', 'adult', -1);
        bind('.rezgo-qty-plus-adult',  'adult',  1);
        bind('.rezgo-qty-minus-child', 'child', -1);
        bind('.rezgo-qty-plus-child',  'child',  1);
    }

    // ── Calendar render ──
    function rezgoRenderCalendar() {
        var tbody = document.getElementById('rezgo-cal-body');
        if (!tbody) return;
        tbody.innerHTML = '';
        var firstDay     = new Date(rezgoCurrentYear, rezgoCurrentMonth - 1, 1).getDay();
        var daysInMonth  = new Date(rezgoCurrentYear, rezgoCurrentMonth, 0).getDate();
        var prevMonthDays = new Date(rezgoCurrentYear, rezgoCurrentMonth - 2, 0).getDate();
        var today = new Date().toISOString().slice(0, 10);
        var day = 1;
        for (var i = 0; i < 6; i++) {
            var row = document.createElement('tr');
            for (var j = 0; j < 7; j++) {
                var cell = document.createElement('td');
                var dayDiv = document.createElement('div');
                dayDiv.className = 'rezgo-cal-day';
                if (i === 0 && j < firstDay) {
                    dayDiv.classList.add('other-month');
                    dayDiv.innerHTML = '<span class="rezgo-cal-date">' + (prevMonthDays - firstDay + j + 1) + '</span>';
                } else if (day > daysInMonth) {
                    dayDiv.classList.add('other-month');
                    dayDiv.innerHTML = '<span class="rezgo-cal-date">' + (day - daysInMonth) + '</span>';
                    day++;
                } else {
                    var dateStr = rezgoCurrentYear + '-' + String(rezgoCurrentMonth).padStart(2, '0') + '-' + String(day).padStart(2, '0');
                    var pricing = rezgoPricingData[dateStr];
                    var isPast  = dateStr < today;
                    if (pricing && pricing.available && !isPast) {
                        dayDiv.classList.add('available');
                        var price = pricing.price_adult || 0;
                        dayDiv.innerHTML = '<span class="rezgo-cal-date">' + day + '</span><span class="rezgo-cal-price">$' + price.toFixed(2).replace(/\.00$/, '') + '</span>';
                        (function(ds, pr, el) { el.addEventListener('click', function() { rezgoSelectDate(ds, pr, el); }); })(dateStr, pricing, dayDiv);
                    } else {
                        dayDiv.classList.add('unavailable');
                        dayDiv.innerHTML = '<span class="rezgo-cal-date">' + day + '</span>';
                    }
                    cell.appendChild(dayDiv);
                    day++;
                }
                row.appendChild(cell);
            }
            tbody.appendChild(row);
        }
    }

    function rezgoLoadMonth() {
        var loadingEl  = document.getElementById('rezgo-cal-loading');
        var tableEl    = document.getElementById('rezgo-cal-table');
        var monthLabel = document.getElementById('rezgo-month-label');
        if (loadingEl) { loadingEl.style.display = 'block'; loadingEl.innerHTML = '<span class="rezgo-spinner"></span> Loading…'; }
        if (tableEl) tableEl.style.display = 'none';
        if (monthLabel) monthLabel.textContent = rezgoMonthNames[rezgoCurrentMonth - 1] + ' ' + rezgoCurrentYear;
        fetch('/api/rezgo/pricing/month?uid=' + rezgoUid + '&year=' + rezgoCurrentYear + '&month=' + rezgoCurrentMonth)
            .then(function(r) { return r.json(); })
            .then(function(data) {
                if (loadingEl) loadingEl.style.display = 'none';
                if (data.success && data.dates) {
                    rezgoPricingData = {};
                    data.dates.forEach(function(d) { rezgoPricingData[d.date] = d; });
                    rezgoRenderCalendar();
                    if (tableEl) tableEl.style.display = 'table';
                    // Update "as low as" with lowest price in this month
                    var prices = data.dates.filter(function(d) { return d.available && d.price_adult > 0; }).map(function(d) { return d.price_adult; });
                    if (prices.length) {
                        var lowest = Math.min.apply(null, prices);
                        var alpEl  = document.getElementById('rezgo-as-low-as-price');
                        if (alpEl) alpEl.textContent = '$' + lowest.toFixed(2);
                    }
                } else {
                    if (loadingEl) loadingEl.innerHTML = '<span style="color:#999">No availability this month</span>';
                }
            })
            .catch(function() {
                if (loadingEl) loadingEl.innerHTML = '<span style="color:#c00">Failed to load</span>';
            });
    }

    function rezgoInitCalendar() {
        if (!calContainer) return;
        calContainer.innerHTML = '<div class="rezgo-calendar-inline">'
            + '<div class="rezgo-cal-header"><button type="button" id="rezgo-prev">&larr;</button><strong id="rezgo-month-label"></strong><button type="button" id="rezgo-next">&rarr;</button></div>'
            + '<div id="rezgo-cal-loading" class="rezgo-cal-loading"><span class="rezgo-spinner"></span> Loading…</div>'
            + '<table class="rezgo-cal-table" id="rezgo-cal-table" style="display:none;"><thead><tr><th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th></tr></thead><tbody id="rezgo-cal-body"></tbody></table>'
            + '</div>';
        document.getElementById('rezgo-prev').addEventListener('click', function() {
            rezgoCurrentMonth--; if (rezgoCurrentMonth < 1) { rezgoCurrentMonth = 12; rezgoCurrentYear--; } rezgoLoadMonth();
        });
        document.getElementById('rezgo-next').addEventListener('click', function() {
            rezgoCurrentMonth++; if (rezgoCurrentMonth > 12) { rezgoCurrentMonth = 1; rezgoCurrentYear++; } rezgoLoadMonth();
        });
        rezgoLoadMonth();
    }
})();
</script>
