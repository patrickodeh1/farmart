<div class="card mt-3">
    <div class="card-header">
        <h3 class="card-title">
            <i class="ti ti-ticket me-2"></i> Rezgo Pricing
        </h3>
    </div>
    <div class="card-body">
        {{--
            Single form for both markup_type and markup_value.
            Previously split into two forms which caused the type to not carry
            over when saving the value, and vice versa.

            The onchange on the select calls rezgoSubmitMarkup() which:
              1. Disables Botble's dirty-form guard (sets data-dirty="false" /
                 removes the beforeunload listener) so the "unsaved changes"
                 browser popup does not block the submit.
              2. Submits the form normally.

            The sell price hint is recalculated live in JS on both type change
            and value change so the admin sees the correct preview before saving.
        --}}




            <div id="rezgo-markup-wrap-{{ $mapping->id }}">
            <input type="hidden" name="rezgo_price_val" value="{{ $mapping->rezgo_price }}">
            <input type="hidden" name="mapping_id"     value="{{ $mapping->id }}">
            <input type="hidden" name="product_id"     value="{{ $product->id }}">
            <input type="hidden" name="rezgo_uid"      value="{{ $mapping->rezgo_uid }}">
            <input type="hidden" name="rezgo_title"    value="{{ $mapping->rezgo_title }}">
            <input type="hidden" name="passenger_type" value="{{ $mapping->passenger_type }}">

            <div class="row g-3">
                {{-- Wholesale price (read-only display) --}}
                <div class="col-md-4">
                    <label class="form-label">Rezgo Wholesale Price</label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <input type="text" class="form-control"
                               value="{{ number_format($mapping->rezgo_price, 2) }}" readonly>
                    </div>
                    <small class="form-hint">Your cost from Rezgo</small>
                </div>

                {{-- Markup type --}}
                <div class="col-md-4">
                    <label class="form-label">Markup Type</label>
                    <select name="markup_type"
                            id="rezgo-markup-type-{{ $mapping->id }}"
                            class="form-select"
                            onchange="rezgoSubmitMarkup('{{ $mapping->id }}')">
                        <option value="percent"
                            {{ $mapping->markup_type === 'percent' ? 'selected' : '' }}>
                            Percentage (%)
                        </option>
                        <option value="fixed"
                            {{ $mapping->markup_type === 'fixed' ? 'selected' : '' }}>
                            Fixed Amount ($)
                        </option>
                    </select>
                </div>

                {{-- Markup value + save button --}}
                <div class="col-md-4">
                    <label class="form-label">Markup Value</label>
                    <div class="input-group">
                        <input type="number"
                               name="markup_value"
                               id="rezgo-markup-value-{{ $mapping->id }}"
                               class="form-control"
                               value="{{ $mapping->markup_value }}"
                               step="0.01" min="0"
                               oninput="rezgoUpdateHint('{{ $mapping->id }}', {{ $mapping->rezgo_price }})">
                        <button type="submit" id="rezgo-save-btn-{{ $mapping->id }}"
                                class="btn btn-primary"
                                onclick="rezgoSubmitMarkup('{{ $mapping->id }}')">
                            Save
                        </button>
                    </div>
                    <small class="form-hint"
                           id="rezgo-markup-hint-{{ $mapping->id }}">
                        @if ($mapping->markup_type === 'percent')
                            Current sell price ≈
                            ${{ number_format($mapping->rezgo_price * (1 + $mapping->markup_value / 100), 2) }}
                        @else
                            Current sell price ≈
                            ${{ number_format($mapping->rezgo_price + $mapping->markup_value, 2) }}
                        @endif
                    </small>
                </div>
            </div>
            </div>{{-- /rezgo-markup-wrap --}}

    </div>
</div>

<script>
(function () {
    /**
     * Submit the markup form cleanly.
     * Botble's admin JS watches for form changes and shows a browser "unsaved
     * changes" confirm when any form on the page is dirty. We clear that flag
     * before submitting so the popup never appears.
     */
    window.rezgoSubmitMarkup = function (mappingId) {
        // fetch POST — markup box is nested inside Botble product form so we
        // cannot use a real form submit. fetch bypasses that entirely.
        var wrap = document.getElementById('rezgo-markup-wrap-' + mappingId);
        if (!wrap) { alert('Markup wrapper not found'); return; }
        var metaCsrf = document.querySelector('meta[name="csrf-token"]');
        var token = metaCsrf ? metaCsrf.getAttribute('content')
                             : (wrap.querySelector('[name=_token]') ? wrap.querySelector('[name=_token]').value : '');
        var data = new FormData();
        data.append('_token',         token);
        data.append('mapping_id',     wrap.querySelector('[name=mapping_id]').value);
        data.append('product_id',     wrap.querySelector('[name=product_id]').value);
        data.append('rezgo_uid',      wrap.querySelector('[name=rezgo_uid]').value);
        data.append('rezgo_title',    wrap.querySelector('[name=rezgo_title]') ? wrap.querySelector('[name=rezgo_title]').value : '');
        data.append('passenger_type', wrap.querySelector('[name=passenger_type]').value);
        data.append('markup_type',    document.getElementById('rezgo-markup-type-'  + mappingId).value);
        data.append('markup_value',   document.getElementById('rezgo-markup-value-' + mappingId).value);
        var saveBtn = document.getElementById('rezgo-save-btn-' + mappingId);
        if (saveBtn) { saveBtn.textContent = 'Saving...'; saveBtn.disabled = true; }
        fetch('/admin/rezgo-connector/product-mappings', { method: 'POST', body: data })
            .then(function(r) { return r.ok ? r.text() : Promise.reject(r.status); })
            .then(function() {
                var rezgoPrice = parseFloat(wrap.querySelector('[name=rezgo_price_val]').value) || 0;
                rezgoUpdateHint(mappingId, rezgoPrice);
                if (saveBtn) { saveBtn.textContent = 'Saved!'; saveBtn.disabled = false; }
                setTimeout(function() { if (saveBtn) saveBtn.textContent = 'Save'; }, 2000);
            })
            .catch(function(err) {
                if (saveBtn) { saveBtn.textContent = 'Error'; saveBtn.disabled = false; }
                alert('Save failed: ' + err);
            });
    };

    /**
     * Update the sell price hint live as the admin types a new markup value
     * or switches markup type — without needing a page reload.
     */
    window.rezgoUpdateHint = function (mappingId, rezgoPrice) {
        var typeEl  = document.getElementById('rezgo-markup-type-'  + mappingId);
        var valueEl = document.getElementById('rezgo-markup-value-' + mappingId);
        var hintEl  = document.getElementById('rezgo-markup-hint-'  + mappingId);
        if (!typeEl || !valueEl || !hintEl) return;

        var type  = typeEl.value;
        var value = parseFloat(valueEl.value) || 0;
        var sell;

        if (type === 'percent') {
            sell = rezgoPrice * (1 + value / 100);
        } else {
            sell = rezgoPrice + value;
        }

        hintEl.textContent = 'Current sell price ≈ $' + sell.toFixed(2);
    };

    // Also update hint when markup type changes (before form submits)
    document.querySelectorAll('[data-rezgo-markup-form]').forEach(function (form) {
        var mappingId = form.id.replace('rezgo-markup-form-', '');
        var typeEl    = form.querySelector('[id^="rezgo-markup-type-"]');
        var rezgoPrice = parseFloat(
            form.closest('.card-body')
                ?.querySelector('input[readonly]')
                ?.value?.replace(',', '') || 0
        );
        if (typeEl) {
            typeEl.addEventListener('change', function () {
                rezgoUpdateHint(mappingId, rezgoPrice);
            });
        }
    });
})();
</script>