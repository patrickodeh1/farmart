@php
    $rezgoMapping = null;
    if (isset($product) && $product instanceof \Illuminate\Database\Eloquent\Model) {
        $rezgoMapping = \Botble\RezgoConnector\Models\RezgoProductMapping::where('product_id', $product->id)->first();
    }
    if (!$rezgoMapping || !$rezgoMapping->is_active) return;
@endphp

<div class="rezgo-calendar-widget mb-3">
    <div class="rezgo-calendar-wrapper">
        <h5 class="rezgo-section-title mb-3">{{ __('Select Tour Date') }}</h5>
        <div id="rezgo-tour-calendar" class="rezgo-calendar-container">
            <div class="rezgo-cal-loading py-2 text-center">
                <span class="rezgo-spinner" role="status" aria-hidden="true"></span>
                <span class="ms-2">{{ __('Loading availability...') }}</span>
            </div>
        </div>
        <div id="rezgo-selected-info" class="rezgo-selected-info mt-3" style="display: none;">
            <div id="rezgo-selected-date-display" class="rezgo-selected-date-display"></div>
        </div>
    </div>
</div>

<style>
.rezgo-calendar-widget{margin-top:1rem;clear:both;font-family:inherit}
.rezgo-section-title{font-size:1rem;font-weight:600;color:#333;margin-bottom:0.75rem}
.rezgo-calendar-inline{border:1px solid #e5e5e5;border-radius:8px;padding:12px;background:#fafafa}
.rezgo-cal-header{display:flex;justify-content:space-between;align-items:center;margin-bottom:10px;padding-bottom:8px;border-bottom:1px solid #e5e5e5}
.rezgo-cal-header button{background:none;border:1px solid #ddd;border-radius:4px;padding:4px 12px;cursor:pointer;font-size:14px}
.rezgo-cal-header button:hover{background:#e5e5e5}
.rezgo-cal-table{width:100%;border-collapse:collapse}
.rezgo-cal-table th{font-size:11px;padding:4px 2px;text-align:center;color:#666;font-weight:500}
.rezgo-cal-table td{padding:2px;vertical-align:top}
.rezgo-cal-day{text-align:center;padding:4px 2px;cursor:default;position:relative;min-height:44px;border-radius:4px}
.rezgo-cal-day.other-month{color:#aaa;background:#f5f5f5;border-radius:4px}
.rezgo-cal-day.available{cursor:pointer;background:#fff;border:1px solid #e5e5e5;transition:background 0.15s ease}
.rezgo-cal-day.available:hover{background:#e8f4fd;border-color:#0d6efd}
.rezgo-cal-day.selected{background:#0d6efd !important;color:white;border-color:#0d6efd}
.rezgo-cal-day.unavailable{opacity:0.5;background:#f0f0f0;border-radius:4px}
.rezgo-cal-date{font-size:12px;display:block;line-height:1.2;font-weight:500}
.rezgo-cal-price{font-size:9px;color:#0d6efd;display:block;margin-top:2px;font-weight:600}
.rezgo-cal-day.selected .rezgo-cal-price{color:#e8e8e8}
.rezgo-cal-loading{padding:20px;text-align:center;color:#666}
.rezgo-spinner{display:inline-block;width:1rem;height:1rem;border:0.15em solid rgba(0,0,0,0.1);border-left-color:#0d6efd;border-radius:50%;animation:spin 1s linear infinite}
@keyframes spin{to{transform:rotate(360deg)}}
.rezgo-selected-alert{background:#e8f5e9;border:1px solid #4caf50;border-radius:8px;padding:12px 16px;color:#2e7d32;margin-bottom:12px}
.rezgo-selected-alert-title{font-weight:600;margin-bottom:4px}
.rezgo-passenger-row{display:flex;align-items:center;justify-content:space-between;margin-bottom:12px;padding:8px 0;border-bottom:1px solid #eee}
.rezgo-passenger-row:last-child{border-bottom:none;margin-bottom:0}
.rezgo-passenger-label{flex:1}
.rezgo-passenger-name{font-weight:600;font-size:14px}
.rezgo-passenger-price{color:#666;font-size:12px}
.rezgo-passenger-price-total{color:#0d6efd;font-weight:600;font-size:14px}
.rezgo-qty-selector{display:flex;align-items:center;border:1px solid #ddd;border-radius:6px;overflow:hidden}
.rezgo-qty-selector button{background:#f8f9fa;border:none;width:36px;height:36px;cursor:pointer;font-size:18px;font-weight:500;color:#333;transition:background 0.15s}
.rezgo-qty-selector button:hover{background:#e9ecef}.rezgo-qty-selector button:disabled{opacity:0.4;cursor:not-allowed}
.rezgo-qty-selector input{width:50px;height:36px;border:none;border-left:1px solid #ddd;border-right:1px solid #ddd;text-align:center;font-size:14px;font-weight:600;-moz-appearance:textfield;appearance:none}
.rezgo-qty-selector input::-webkit-outer-spin-button,.rezgo-qty-selector input::-webkit-inner-spin-button{-webkit-appearance:none;margin:0}
.rezgo-booking-summary{background:#f8f9fa;border:1px solid #e5e5e5;border-radius:8px;padding:12px 16px;margin-top:12px}
.rezgo-booking-summary-row{display:flex;justify-content:space-between;align-items:center;padding:4px 0;font-size:14px}
.rezgo-booking-summary-total{font-size:18px;font-weight:700;color:#0d6efd}
.rezgo-error-alert{background:#fff3cd;border:1px solid #ffc107;border-radius:8px;padding:10px 16px;color:#856404;margin-top:12px;font-size:13px}
.rezgo-error-alert a{color:#0d6efd;text-decoration:underline}
</style>

<script>
(function(){
    const rezgoUid='{{ $rezgoMapping->rezgo_uid }}';
    let rezgoCurrentYear=new Date().getFullYear();
    let rezgoCurrentMonth=new Date().getMonth()+1;
    let rezgoPricingData={};
    let rezgoSelectedDayEl=null;
    let rezgoSelectedDate=null;
    let rezgoSelectedPricing=null;
    const rezgoMonthNames=['January','February','March','April','May','June','July','August','September','October','November','December'];
    const rezgoCalContainer=document.getElementById('rezgo-tour-calendar');
    const rezgoSelectedInfo=document.getElementById('rezgo-selected-info');
    const rezgoSelectedDateDisplay=document.getElementById('rezgo-selected-date-display');
    const REZGO_MAX_QTY=20;

    /**
     * Find the Botble/Farmart add-to-cart form.
     * The widget is injected OUTSIDE the form (via add_filter on product description),
     * so closest('form') won't work. Search the whole document instead.
     */
    function rezgoFindCartForm(){
        // Primary: Botble's known data attribute
        var form=document.querySelector('form[data-bb-toggle="product-form"]');
        if(form)return form;
        // Secondary: any form with a cart action
        form=document.querySelector('form[action*="cart"]');
        if(form)return form;
        // Tertiary: any form containing qty inputs
        var qtyInput=document.querySelector('form input[name="qty"]');
        if(qtyInput)return qtyInput.closest('form');
        // Fallback: any form in the product detail area
        form=document.querySelector('.product-detail form, .product-form form, form.add-to-cart');
        if(form)return form;
        return null;
    }

    /**
     * Inject hidden inputs into the cart form. Reuses existing inputs if present.
     * All fields wrapped in extras[] array for proper Farmart capture.
     */
    function rezgoUpdateForm(){
        var form=rezgoFindCartForm();
        if(!form)return;

        // Helper: get or create a hidden input by name
        function h(name){
            var el=form.querySelector('input[name="'+name+'"]');
            if(!el){el=document.createElement('input');el.type='hidden';el.name=name;form.appendChild(el);}
            return el;
        }

        var adultEl=document.getElementById('rezgo-qty-adult');
        var childEl=document.getElementById('rezgo-qty-child');
        var adultQty=adultEl?Math.max(0,parseInt(adultEl.value||0)):1;
        var childQty=childEl?Math.max(0,parseInt(childEl.value||0)):0;
        var adultPrice=rezgoSelectedPricing?(rezgoSelectedPricing.price_adult||0):0;
        var childPrice=rezgoSelectedPricing?(rezgoSelectedPricing.price_child||0):0;
        var grandTotal=(adultPrice*adultQty)+(childPrice*childQty);

        // Core booking metadata for rezgo_meta and order submission
        h('extras[rezgo_date]').value=rezgoSelectedDate||'';
        h('extras[rezgo_uid]').value=rezgoUid;
        h('extras[rezgo_price]').value=adultPrice.toFixed(2);
        h('extras[rezgo_child_price]').value=childPrice.toFixed(2);
        h('extras[rezgo_adult_qty]').value=adultQty;
        h('extras[rezgo_child_qty]').value=childQty;

        // Grand total — the server-side hook writes this to ec_products.price temporarily.
        h('extras[rezgo_total]').value=grandTotal.toFixed(2);

        // Send qty = total tickets (adult + child) so cart shows correct count.
        // The hook sets ec_products.price = grandTotal and qty = totalTickets,
        // so Farmart's price * qty would double-count. To avoid this, we send
        // per-ticket blended price and total qty instead.
        // blended = grandTotal / totalTickets so price * qty = grandTotal exactly.
        var totalTickets=adultQty+childQty;
        if(totalTickets<1)totalTickets=1;
        var blendedPrice=totalTickets>0?grandTotal/totalTickets:grandTotal;
        h('extras[rezgo_blended_price]').value=blendedPrice.toFixed(2);
        var qtyInput=form.querySelector('input[name="qty"]');
        if(qtyInput)qtyInput.value=totalTickets;
    }

    function rezgoUpdateTotalDisplay(){
        const adultQty=parseInt(document.getElementById('rezgo-qty-adult')?.value)||0;
        const childQty=parseInt(document.getElementById('rezgo-qty-child')?.value)||0;
        if(!rezgoSelectedPricing)return;
        const adultTotal=(rezgoSelectedPricing.price_adult||0)*adultQty;
        const childTotal=(rezgoSelectedPricing.price_child||0)*childQty;
        const total=adultTotal+childTotal;
        const totalEl=document.getElementById('rezgo-booking-total');
        if(totalEl)totalEl.textContent='$'+total.toFixed(2);
        // Re-sync form hidden inputs (including rezgo_total) every time qty changes
        rezgoUpdateForm();
    }

    function rezgoSelectDate(date,pricing,el){
        if(rezgoSelectedDayEl)rezgoSelectedDayEl.classList.remove('selected');
        rezgoSelectedDayEl=el;el.classList.add('selected');
        rezgoSelectedDate=date;rezgoSelectedPricing=pricing;
        if(rezgoSelectedInfo)rezgoSelectedInfo.style.display='block';
        const hasChild=pricing.price_child>0;
        let html='<div class="rezgo-selected-alert"><div class="rezgo-selected-alert-title"><i class="ti ti-calendar-check me-1"></i> Selected: '+date+'</div><div style="font-size:12px;color:#555">Tour date confirmed</div></div>';
        html+='<div class="rezgo-booking-summary">';
        html+='<div class="rezgo-booking-summary-row" style="border-bottom:1px solid #ddd;padding-bottom:8px;margin-bottom:8px;font-weight:600"><span>Passenger Type</span><span>Qty x Price</span></div>';
        html+='<div class="rezgo-passenger-row"><div class="rezgo-passenger-label"><div class="rezgo-passenger-name">Adult</div><div class="rezgo-passenger-price">$'+(pricing.price_adult||0).toFixed(2)+' per person</div></div><div class="rezgo-qty-selector"><button type="button" class="rezgo-qty-minus-adult" data-type="adult">-</button><input type="number" id="rezgo-qty-adult" value="1" min="0" max="'+REZGO_MAX_QTY+'" readonly><button type="button" class="rezgo-qty-plus-adult" data-type="adult">+</button></div></div>';
        // Child row always shown — disabled with (not available) label when price is 0
        var childDisabled=hasChild?'':' disabled';
        var childMax=hasChild?REZGO_MAX_QTY:0;
        var childNote=hasChild?'':' <span style="color:#aaa;font-size:11px">(not available)</span>';
        html+='<div class="rezgo-passenger-row"><div class="rezgo-passenger-label"><div class="rezgo-passenger-name">Child</div><div class="rezgo-passenger-price">$'+(pricing.price_child||0).toFixed(2)+' per person'+childNote+'</div></div><div class="rezgo-qty-selector"><button type="button" class="rezgo-qty-minus-child" data-type="child"'+childDisabled+'>-</button><input type="number" id="rezgo-qty-child" value="0" min="0" max="'+childMax+'" readonly><button type="button" class="rezgo-qty-plus-child" data-type="child"'+childDisabled+'>+</button></div></div>';
        html+='<div class="rezgo-booking-summary-row" style="border-top:1px solid #ddd;padding-top:8px;margin-top:8px"><span class="rezgo-booking-summary-total">Total</span><span class="rezgo-booking-summary-total" id="rezgo-booking-total">$'+(pricing.price_adult||0).toFixed(2)+'</span></div>';
        html+='</div>';
        if(rezgoSelectedDateDisplay)rezgoSelectedDateDisplay.innerHTML=html;
        rezgoUpdateForm();
        rezgoBindQtyEvents();
        rezgoUpdateTotalDisplay();
    }

    function rezgoBindQtyEvents(){
        const minusAdult=document.querySelector('.rezgo-qty-minus-adult');
        const plusAdult=document.querySelector('.rezgo-qty-plus-adult');
        const minusChild=document.querySelector('.rezgo-qty-minus-child');
        const plusChild=document.querySelector('.rezgo-qty-plus-child');
        if(minusAdult){minusAdult.addEventListener('click',function(){const el=document.getElementById('rezgo-qty-adult');if(el){const val=Math.max(0,parseInt(el.value||0)-1);el.value=val;rezgoUpdateTotalDisplay();}});}
        if(plusAdult){plusAdult.addEventListener('click',function(){const el=document.getElementById('rezgo-qty-adult');if(el){const val=Math.min(REZGO_MAX_QTY,parseInt(el.value||0)+1);el.value=val;rezgoUpdateTotalDisplay();}});}
        if(minusChild){minusChild.addEventListener('click',function(){const el=document.getElementById('rezgo-qty-child');if(el){const val=Math.max(0,parseInt(el.value||0)-1);el.value=val;rezgoUpdateTotalDisplay();}});}
        if(plusChild){plusChild.addEventListener('click',function(){const el=document.getElementById('rezgo-qty-child');if(el){const val=Math.min(REZGO_MAX_QTY,parseInt(el.value||0)+1);el.value=val;rezgoUpdateTotalDisplay();}});}
        const adultEl=document.getElementById('rezgo-qty-adult');const childEl=document.getElementById('rezgo-qty-child');
        if(adultEl)adultEl.addEventListener('change',rezgoUpdateTotalDisplay);
        if(childEl)childEl.addEventListener('change',rezgoUpdateTotalDisplay);
    }

    function rezgoRenderCalendar(){
        const tbody=document.getElementById('rezgo-cal-body');
        if(!tbody)return;
        tbody.innerHTML='';
        const firstDay=new Date(rezgoCurrentYear,rezgoCurrentMonth-1,1).getDay();
        const daysInMonth=new Date(rezgoCurrentYear,rezgoCurrentMonth,0).getDate();
        const prevMonthDays=new Date(rezgoCurrentYear,rezgoCurrentMonth-2,0).getDate();
        const today=new Date().toISOString().slice(0,10);
        let day=1;
        for(let i=0;i<6;i++){
            const row=document.createElement('tr');
            for(let j=0;j<7;j++){
                const cell=document.createElement('td');
                const dayDiv=document.createElement('div');dayDiv.className='rezgo-cal-day';
                if(i===0&&j<firstDay){dayDiv.classList.add('other-month');dayDiv.innerHTML='<span class="rezgo-cal-date">'+(prevMonthDays-firstDay+j+1)+'</span>';cell.appendChild(dayDiv);}
                else if(day>daysInMonth){dayDiv.classList.add('other-month');dayDiv.innerHTML='<span class="rezgo-cal-date">'+(day-daysInMonth)+'</span>';cell.appendChild(dayDiv);day++;}
                else{
                    const dateStr=rezgoCurrentYear+'-'+String(rezgoCurrentMonth).padStart(2,'0')+'-'+String(day).padStart(2,'0');
                    const pricing=rezgoPricingData[dateStr];const isPast=dateStr<today;
                    if(pricing&&pricing.available&&!isPast){
                        dayDiv.classList.add('available');const price=pricing.price_adult||0;
                        dayDiv.innerHTML='<span class="rezgo-cal-date">'+day+'</span><span class="rezgo-cal-price">$'+price.toFixed(2).replace(/\.00$/, '')+'</span>';
                        dayDiv.addEventListener('click',function(){rezgoSelectDate(dateStr,pricing,dayDiv);});
                    }else{dayDiv.classList.add('unavailable');dayDiv.innerHTML='<span class="rezgo-cal-date">'+day+'</span>';}
                    cell.appendChild(dayDiv);day++;
                }
                row.appendChild(cell);
            }
            tbody.appendChild(row);
        }
    }

    function rezgoLoadMonth(){
        const loadingEl=document.getElementById('rezgo-cal-loading');
        const tableEl=document.getElementById('rezgo-cal-table');
        const monthLabelEl=document.getElementById('rezgo-month-label');
        if(loadingEl){loadingEl.style.display='block';loadingEl.textContent='Loading...';}
        if(tableEl)tableEl.style.display='none';
        if(monthLabelEl)monthLabelEl.textContent=rezgoMonthNames[rezgoCurrentMonth-1]+' '+rezgoCurrentYear;
        fetch('/api/rezgo/pricing/month?uid='+rezgoUid+'&year='+rezgoCurrentYear+'&month='+rezgoCurrentMonth).then(function(r){return r.json();})
            .then(function(data){
                if(loadingEl)loadingEl.style.display='none';
                if(data.success&&data.dates){rezgoPricingData={};data.dates.forEach(function(d){rezgoPricingData[d.date]=d;});rezgoRenderCalendar();if(tableEl)tableEl.style.display='table';}
                else{if(loadingEl)loadingEl.innerHTML='<span style="color:#999">No availability</span>';}
            }).catch(function(){if(loadingEl)loadingEl.innerHTML='<span style="color:#c00">Failed to load</span>';});
    }

    function rezgoInitCalendar(){
        if(!rezgoCalContainer)return;
        rezgoCalContainer.innerHTML='<div class="rezgo-calendar-inline"><div class="rezgo-cal-header"><button type="button" id="rezgo-prev">&larr;</button><strong id="rezgo-month-label"></strong><button type="button" id="rezgo-next">&rarr;</button></div><div id="rezgo-cal-loading" class="rezgo-cal-loading">Loading...</div><table class="rezgo-cal-table" id="rezgo-cal-table" style="display:none;"><thead><tr><th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th></tr></thead><tbody id="rezgo-cal-body"></tbody></table></div>';
        const prevBtn=document.getElementById('rezgo-prev');
        const nextBtn=document.getElementById('rezgo-next');
        if(prevBtn){prevBtn.addEventListener('click',function(){rezgoCurrentMonth--;if(rezgoCurrentMonth<1){rezgoCurrentMonth=12;rezgoCurrentYear--;}rezgoLoadMonth();});}
        if(nextBtn){nextBtn.addEventListener('click',function(){rezgoCurrentMonth++;if(rezgoCurrentMonth>12){rezgoCurrentMonth=1;rezgoCurrentYear++;}rezgoLoadMonth();});}
        rezgoLoadMonth();
    }

    if(document.readyState==='loading'){document.addEventListener('DOMContentLoaded',rezgoInitCalendar);}else{rezgoInitCalendar();}
})();
</script>