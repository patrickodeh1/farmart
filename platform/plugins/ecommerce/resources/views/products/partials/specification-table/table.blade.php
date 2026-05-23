<div class="table-responsive">
    <x-core::table class="table-bordered">
        <x-core::table.header>
            <x-core::table.header.cell>
                {{ trans('plugins/ecommerce::product-specification.product.specification_table.group') }}
            </x-core::table.header.cell>
            <x-core::table.header.cell>
                {{ trans('plugins/ecommerce::product-specification.product.specification_table.attribute') }}
            </x-core::table.header.cell>
            <x-core::table.header.cell>
                {{ trans('plugins/ecommerce::product-specification.product.specification_table.value') }}
            </x-core::table.header.cell>
            <x-core::table.header.cell class="text-center">
                {{ trans('plugins/ecommerce::product-specification.product.specification_table.hide') }}
            </x-core::table.header.cell>
            <x-core::table.header.cell class="text-center" style="width: 40px;">
                {{ trans('plugins/ecommerce::product-specification.product.specification_table.sorting') }}
            </x-core::table.header.cell>
        </x-core::table.header>
        <x-core::table.body>
            @foreach ($specificationTable->groups as $group)
                @foreach ($group->specificationAttributes->sortBy(fn ($attribute) => optional($product?->specificationAttributes->where('id', $attribute->id)->first()?->pivot)->order ?? 0) as $attribute)
                    @php
                        $specificationAttribute = $product?->specificationAttributes->where('id', $attribute->id)->first();
                        $attributeValue = optional($specificationAttribute)->pivot?->value ?: $attribute->default_value;
                    @endphp

                    <x-core::table.body.row>
                        <x-core::table.body.cell>{{ $group->name }}</x-core::table.body.cell>
                        <x-core::table.body.cell>{{ $attribute->name }}</x-core::table.body.cell>
                        <x-core::table.body.cell>
                            @if ($attribute->type == 'checkbox')
                                <input class="form-check-input" type="checkbox" name="specification_attributes[{{ $attribute->id }}][value]" value="1" @checked($attributeValue)>
                            @elseif ($attribute->type == 'select')
                                <select class="form-select" name="specification_attributes[{{ $attribute->id }}][value]">
                                    @foreach ($attribute->options as $value)
                                        <option value="{{ $value }}" @selected($value === $attributeValue)>{{ $value }}</option>
                                    @endforeach
                                </select>
                            @elseif ($attribute->type == 'radio')
                                @foreach ($attribute->options as $value)
                                    <label class="form-check form-check-inline mb-0">
                                        <input class="form-check-input" type="radio" name="specification_attributes[{{ $attribute->id }}][value]" value="{{ $value }}" @checked($value === $attributeValue)>
                                        <span class="form-check-label">{{ $value }}</span>
                                    </label>
                                @endforeach
                            @elseif ($attribute->type == 'text')
                                <input class="form-control" type="text" name="specification_attributes[{{ $attribute->id }}][value]" value="{{ $attributeValue }}">
                            @elseif ($attribute->type == 'textarea')
                                <textarea class="form-control" name="specification_attributes[{{ $attribute->id }}][value]">{{ $attributeValue }}</textarea>
                            @endif
                        </x-core::table.body.cell>
                        <x-core::table.body.cell class="text-center">
                            <input class="form-check-input" type="checkbox" name="specification_attributes[{{ $attribute->id }}][hidden]" value="1" @checked(optional($specificationAttribute)->pivot?->hidden)>
                        </x-core::table.body.cell>
                        <x-core::table.body.cell class="text-center">
                            <input type="hidden" name="specification_attributes[{{ $attribute->id }}][order]" value="{{ optional($specificationAttribute)->pivot?->order ?? $loop->index }}">
                            <x-core::icon name="ti ti-arrows-sort" class="text-secondary" style="cursor: move;" />
                        </x-core::table.body.cell>
                    </x-core::table.body.row>
                @endforeach
            @endforeach
        </x-core::table.body>
    </x-core::table>
</div>
