<div class="quantity">
    <label class="label-quantity">{{ __('Quantity') }}:</label>
    <div class="qty-box">
        <span class="svg-icon decrease">
            <svg>
                <use
                    href="#svg-icon-decrease"
                    xlink:href="#svg-icon-decrease"
                ></use>
            </svg>
        </span>
        <input
            class="input-text qty"
            name="{{ $name ?? 'qty' }}"
            type="number"
            value="{{ $value ?? 1 }}"
            title="Qty"
            tabindex="0"
            step="1"
            min="1"
            max="{{ $product->with_storehouse_management ? $product->quantity : 1000 }}"
            required
        >
        <span class="svg-icon increase">
            <svg>
                <use
                    href="#svg-icon-increase"
                    xlink:href="#svg-icon-increase"
                ></use>
            </svg>
        </span>
    </div>
</div>
