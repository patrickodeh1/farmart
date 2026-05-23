@if (($attributes = $attributes->where('attribute_set_id', $set->id)) && $attributes->isNotEmpty())
    <div class="bb-product-filter-attribute-item">
        <h4 class="bb-product-filter-title">{{ $set->title }}</h4>

        <div class="bb-product-filter-content">
            <div
                data-type="text"
                data-id="{{ $set->id }}"
                data-categories="{{ $set->categories->pluck('id')->toJson() }}"
                @class([
                    'text-swatches-wrapper widget-filter-item',
                    'd-none' =>
                        !empty($categoryId) &&
                        $set->categories->count() &&
                        !$set->categories->contains('id', $categoryId),
                ])
            >
                <div class="widget-content">
                    <div class="attribute-values">
                        <ul class="text-swatch">
                            @foreach ($attributes as $attribute)
                                <li data-slug="{{ $attribute->slug }}">
                                    <div>
                                        <label>
                                            <input
                                                class="product-filter-item"
                                                name="attributes[{{ $set->slug }}][]"
                                                type="checkbox"
                                                value="{{ $attribute->id }}"
                                                @checked(in_array($attribute->id, $selected))
                                            >
                                            <span>{{ $attribute->title }}</span>
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
