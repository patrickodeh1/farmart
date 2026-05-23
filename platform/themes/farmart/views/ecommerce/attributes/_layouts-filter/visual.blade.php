@if (($attributes = $attributes->where('attribute_set_id', $set->id)) && $attributes->isNotEmpty())
    <div class="bb-product-filter-attribute-item">
        <h4 class="bb-product-filter-title">{{ $set->title }}</h4>

        <div class="bb-product-filter-content">
            <div
                data-id="{{ $set->id }}"
                data-type="visual"
                data-categories="{{ $set->categories->pluck('id')->toJson() }}"
                @class([
                    'visual-swatches-wrapper widget--colors widget-filter-item',
                    'd-none' =>
                        !empty($categoryId) &&
                        $set->categories->isNotEmpty() &&
                        !$set->categories->contains('id', $categoryId),
                ])
            >
                <div class="widget-content">
                    <div class="attribute-values">
                        <ul class="visual-swatch color-swatch">
                            @foreach ($attributes as $attribute)
                                <li
                                    data-slug="{{ $attribute->slug }}"
                                    title="{{ $attribute->title }}"
                                >
                                    <div class="custom-checkbox">
                                        <label>
                                            <input
                                                class="form-control product-filter-item"
                                                name="attributes[{{ $set->slug }}][]"
                                                type="checkbox"
                                                value="{{ $attribute->id }}"
                                                @checked(in_array($attribute->id, $selected))
                                            >
                                            <span style="{{ $attribute->getAttributeStyle() }}"></span>
                                        </label>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
