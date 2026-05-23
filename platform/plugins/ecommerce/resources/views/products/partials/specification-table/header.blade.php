<select class="form-select" name="specification_table_id" id="specification_table_id">
    <option value="">{{ trans('plugins/ecommerce::product-specification.product.specification_table.select_none') }}</option>
    @foreach($tables as $value => $label)
        <option value="{{ $value }}" @selected($model->specification_table_id === $value)>{{ $label }}</option>
    @endforeach
</select>
