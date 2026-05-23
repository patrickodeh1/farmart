@if (($attributes = $attributes->where('attribute_set_id', $set->id)) && $attributes->isNotEmpty())
    <div
        class="bb-product-attribute-swatch text-swatches-wrapper attribute-swatches-wrapper"
        data-type="text"
        data-slug="{{ $set->slug }}"
    >
        <h4 class="bb-product-attribute-swatch-title">{{ $set->title }}:</h4>
        <ul class="bb-product-attribute-swatch-list text-swatch attribute-swatch">
            @foreach ($attributes as $attribute)
                <li
                    data-slug="{{ $attribute->slug }}"
                    data-id="{{ $attribute->id }}"
                    @class([
                        'bb-product-attribute-swatch-item attribute-swatch-item',
                        'disabled' => ! $variationInfo->where('id', $attribute->id)->isNotEmpty(),
                    ])
                >
                    <label>
                        <input
                            name="attribute_{{ $set->slug }}_{{ $key }}"
                            data-slug="{{ $attribute->slug }}"
                            @if (! empty($referenceProduct)) data-reference-product="{{ $referenceProduct->slug }}" @endif
                            type="radio"
                            value="{{ $attribute->id }}"
                            @checked($selected->where('id', $attribute->id)->isNotEmpty())
                            class="product-filter-item"
                        >
                        <span class="bb-product-attribute-text-display">{{ $attribute->title }}</span>
                    </label>
                </li>
            @endforeach
        </ul>
    </div>
@endif
