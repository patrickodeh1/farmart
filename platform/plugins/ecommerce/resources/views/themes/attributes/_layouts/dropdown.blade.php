@if (($attributes = $attributes->where('attribute_set_id', $set->id)) && $attributes->isNotEmpty())
    <div
        class="bb-product-attribute-swatch dropdown-swatches-wrapper attribute-swatches-wrapper"
        data-type="dropdown"
        data-slug="{{ $set->slug }}"
    >
        <h4 class="bb-product-attribute-swatch-title">{{ $set->title }}:</h4>
        <div class="bb-product-attribute-swatch-list attribute-swatch">
            <select class="form-select product-filter-item">
                <option value="">{{ __('Select :name', ['name' => strtolower($set->title)]) }}</option>
                @foreach ($attributes as $attribute)
                    <option
                        data-id="{{ $attribute->id }}"
                        data-slug="{{ $attribute->slug }}"
                        @if (! empty($referenceProduct)) data-reference-product="{{ $referenceProduct->slug }}" @endif
                        value="{{ $attribute->id }}"
                        @selected($selected->where('id', $attribute->id)->isNotEmpty())
                        @disabled($variationInfo->where('id', $attribute->id)->isEmpty())
                    >
                        {{ $attribute->title }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>
@endif
