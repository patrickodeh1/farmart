@php
    // Check if this product has a Rezgo mapping
    $rezgoMapping = null;
    if (isset($product) && $product instanceof \Illuminate\Database\Eloquent\Model) {
        $rezgoMapping = \Botble\RezgoConnector\Models\RezgoProductMapping::where('product_id', $product->id)->first();
    }
    
    // If no mapping or not active, don't show calendar
    if (!$rezgoMapping || !$rezgoMapping->is_active) {
        return;
    }
@endphp

@php
    $rezgoUid = $rezgoMapping->rezgo_uid;
    $rezgoTitle = $rezgoMapping->rezgo_title ?? $product->name;
    $images = !empty($tour['images']) ? $tour['images'] : ([$product->image] ?? []);
    $mainImage = !empty($images) ? $images[0] : ( $product->image ?? '' );
@endphp

<div class="rezgo-calendar-container">
    <div class="bg-light py-md-5 px-lg-3 px-2">
        <div class="container-xxxl">
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('rezgo.storefront.tours') }}">Tours</a></li>
                    <li class="breadcrumb-item active">{{ $rezgoTitle }}</li>
                </ol>
            </nav>

            <div class="row">
                {{-- Left: Images + Description --}}
                <div class="col-lg-7 mb-4">
                    @if ($mainImage)
                        <img src="{{ RvMedia::getImageUrl($mainImage) }}" class="img-fluid rounded mb-3 w-100"
                             alt="{{ $rezgoTitle }}" style="max-height:400px; object-fit:cover;">
                    @endif

                    @if ($product->description)
                        <div class="mt-4 ck-content">
                            {!! $product->description !!}
                        </div>
                    @endif
                </div>

                {{-- Right: Booking form --}}
                <div class="col-lg-5">
                    <div class="card border-0 shadow-sm p-4 sticky-top" style="top:20px;">
                        <h4 class="fw-bold mb-1">{{ $rezgoTitle }}</h4>
                        <p class="text-muted small mb-3">
                            <i class="ti ti-map-pin"></i> 
                            @if (!empty($rezgoMapping->rezgo_title))
                                {{ $rezgoMapping->rezgo_title }}
                            @else
                                Location from Rezgo data
                            @endif
                        </p>
                        
                        {{-- Booking form --}}
                        <form action="{{ route('rezgo.storefront.cart.add') }}" method="POST" id="rezgo-booking-form">
                            @csrf
                            <input type="hidden" name="uid" value="{{ $rezgoUid }}">
                            <input type="hidden" name="title" value="{{ $rezgoTitle }}">
                            <input type="hidden" name="image" value="{{ $mainImage }}">
                            <input type="hidden" name="date" id="selected-date" value="">
                            <input type="hidden" name="price_adult" id="selected-price-adult" value="0">
                            <input type="hidden" name="price_child" id="selected-price-child" value="0">
                            <div id="booking-details" style="display:none;">
                                <div class="alert alert-success py-2 mb-3" id="selected-date-display"></div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Adults <span id="adult-price-label" class="text-muted fw-normal"></span></label>
                                    <div class="input-group">
                                        <button type="button" class="btn btn-outline-secondary" onclick="changeQty('adult', -1)">-</button>
                                        <input type="number" name="qty_adult" id="qty-adult" class="form-control text-center" value="1" min="0" max="20">
                                        <button type="button" class="btn btn-outline-secondary" onclick="changeQty('adult', 1)">+</button>
                                    </div>
                                </div>
                                <div class="mb-3" id="child-row" style="display:none;">
                                    <label class="form-label fw-bold">Children <span id="child-price-label" class="text-muted fw-normal"></span></label>
                                    <div class="input-group">
                                        <button type="button" class="btn btn-outline-secondary" onclick="changeQty('child', -1)">-</button>
                                        <input type="number" name="qty_child" id="qty-child" class="form-control text-center" value="0" min="0" max="20">
                                        <button type="button" class="btn btn-outline-secondary" onclick="changeQty('child', 1)">+</button>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="fw-bold">Total:</span>
                                    <span class="fw-bold text-primary fs-5" id="booking-total">$0.00</span>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 btn-lg">
                                    <i class="ti ti-shopping-cart me-1"></i> Add to Cart
                                </button>
                            </div>
                            <div id="select-date-prompt" class="text-center text-muted py-3">
                                <i class="ti ti-calendar fs-2 d-block mb-2"></i>
                                Select a date above to see pricing and book
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@if (isset($rezgoUid))
<script>
(function() {
    const uid = '{{ $rezgoUid }}';
    let currentYear  = new Date().getFullYear();
    let currentMonth = new Date().getMonth() + 1;
    let pricingData  = {};
    let selectedDayEl = null;
    const monthNames = ['January','February','March','April','May','June','July','August','September','October','November','December'];
    const calContainer = document.getElementById('rezgo-tour-calendar');
    const bookingDetails = document.getElementById('booking-details');
    const selectPrompt   = document.getElementById('select-date-prompt');
    const hiddenDate     = document.getElementById('selected-date');
    const hiddenAdult    = document.getElementById('selected-price-adult');
    const hiddenChild    = document.getElementById('selected-price-child');
    
    // Build calendar HTML
    if (calContainer) {
        calContainer.innerHTML = 
            `<div class="rezgo-calendar-inline">
                <div class="rezgo-cal-header">
                    <button type="button" id="rezgo-prev">&larr;</button>
                    <strong id="rezgo-month-label"></strong>
                    <button type="button" id="rezgo-next">&rarr;</button>
                </div>
                <div id="rezgo-cal-loading" class="rezgo-cal-loading">Loading prices...</div>
                <table class="rezgo-cal-table" id="rezgo-cal-table" style="display:none;">
                    <thead><tr>
                        <th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th>
                    </tr></thead>
                    <tbody id="rezgo-cal-body"></tbody>
                </table>
            </div>`;
        
        const prevButton = document.getElementById('rezgo-prev');
        const nextButton = document.getElementById('rezgo-next');
        const loading = document.getElementById('rezgo-cal-loading');
        const table = document.getElementById('rezgo-cal-table');
        const monthLabel = document.getElementById('rezgo-month-label');
        const calBody = document.getElementById('rezgo-cal-body');
        
        if (prevButton) prevButton.addEventListener('click', function() {
            currentMonth--;
            if (currentMonth < 1) { currentMonth = 12; currentYear--; }
            loadMonth();
        });
        
        if (nextButton) nextButton.addEventListener('click', function() {
            currentMonth++;
            if (currentMonth > 12) { currentMonth = 1; currentYear++; }
            loadMonth();
        });
        
        function loadMonth() {
            if (loading) loading.style.display = 'block';
            if (table) table.style.display = 'none';
            if (monthLabel) monthLabel.textContent = monthNames[currentMonth-1] + ' ' + currentYear;
            
            fetch('/api/rezgo/pricing/month?uid=' + uid + '&year=' + currentYear + '&month=' + currentMonth)
                .then(r => r.json())
                .then(data => {
                    if (loading) loading.style.display = 'none';
                    if (data.success && data.dates) {
                        pricingData = {};
                        data.dates.forEach(d => { pricingData[d.date] = d; });
                        renderCalendar();
                        if (table) table.style.display = 'table';
                    } else {
                        if (loading) loading.textContent = 'Failed to load pricing.';
                    }
                })
                .catch(() => {
                    if (loading) loading.textContent = 'Failed to load pricing.';
                });
        }
        
        function renderCalendar() {
            const tbody = document.getElementById('rezgo-cal-body');
            if (!tbody) return;
            tbody.innerHTML = '';
            const firstDay = new Date(currentYear, currentMonth-1, 1).getDay();
            const daysInMonth = new Date(currentYear, currentMonth, 0).getDate();
            const prevMonthDays = new Date(currentYear, currentMonth-1, 0).getDate();
            const today = new Date().toISOString().slice(0,10);
            let day = 1;
            
            for (let i = 0; i < 6; i++) {
                const row = document.createElement('tr');
                for (let j = 0; j < 7; j++) {
                    const cell = document.createElement('td');
                    const dayDiv = document.createElement('div');
                    if (i === 0 && j < firstDay) {
                        dayDiv.className = 'rezgo-cal-day other-month';
                        dayDiv.innerHTML = '<span class="rezgo-cal-date">' + (prevMonthDays - firstDay + j + 1) + '</span>';
                    } else if (day > daysInMonth) {
                        dayDiv.className = 'rezgo-cal-day other-month';
                        dayDiv.innerHTML = '<span class="rezgo-cal-date">' + (day - daysInMonth) + '</span>';
                        day++;
                    } else {
                        const dateStr = currentYear + '-' + String(currentMonth).padStart(2,'0') + '-' + String(day).padStart(2,'0');
                        const pricing = pricingData[dateStr];
                        const isPast = dateStr <= today;
                        if (pricing && pricing.available && !isPast) {
                            dayDiv.className = 'rezgo-cal-day available';
                            dayDiv.innerHTML = '<span class="rezgo-cal-date">' + day + '</span>'
                                + '<span class="rezgo-cal-price">$' + pricing.price_adult.toFixed(2) + '</span>';
                            dayDiv.addEventListener('click', (function(ds, pr, el) {
                                return function() { selectDate(ds, pr, el); };
                            })(dateStr, pricing, dayDiv));
                        } else {
                            dayDiv.className = 'rezgo-cal-day unavailable';
                            dayDiv.innerHTML = '<span class="rezgo-cal-date">' + day + '</span>';
                        }
                        cell.appendChild(dayDiv);
                        day++;
                    }
                    row.appendChild(cell);
                }
                if (tbody) tbody.appendChild(row);
            }
        }
        
        function selectDate(date, pricing, el) {
            if (selectedDayEl) selectedDayEl.classList.remove('selected');
            selectedDayEl = el;
            el.classList.add('selected');
            hiddenDate.value = date;
            hiddenAdult.value = pricing.price_adult;
            hiddenChild.value = pricing.price_child;
            document.getElementById('adult-price-label').textContent = '($' + pricing.price_adult.toFixed(2) + ' each)';
            const childRow = document.getElementById('child-row');
            if (pricing.price_child > 0) {
                document.getElementById('child-price-label').textContent = '($' + pricing.price_child.toFixed(2) + ' each)';
                childRow.style.display = 'block';
            } else {
                childRow.style.display = 'none';
            }
            document.getElementById('selected-date-display').textContent = 'Selected: ' + date + ' — from $' + pricing.price_adult.toFixed(2);
            bookingDetails.style.display = 'block';
            selectPrompt.style.display = 'none';
            updateTotal();
        }
        
        function updateTotal() {
            const adultPrice = parseFloat(hiddenAdult.value || 0);
            const childPrice = parseFloat(hiddenChild.value || 0);
            const adultQty = parseInt(document.getElementById('qty-adult').value || 0);
            const childQty = parseInt(document.getElementById('qty-child').value || 0);
            const total = (adultPrice * adultQty) + (childPrice * childQty);
            document.getElementById('booking-total').textContent = '$' + total.toFixed(2);
        }
        
        window.changeQty = function(type, delta) {
            const input = document.getElementById('qty-' + type);
            const val = Math.max(0, parseInt(input.value || 0) + delta);
            input.value = val;
            updateTotal();
        };
        
        // Initialize calendar
        loadMonth();
    }
})();
</script>
@endif
