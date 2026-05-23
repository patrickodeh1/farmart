<?php

namespace Botble\Ecommerce\Http\Requests\API;

use Botble\Support\Http\Requests\Request;

class BrandRequest extends Request
{
    public function rules(): array
    {
        return [
            'brands' => ['nullable', 'array'],
            'brands.*' => ['nullable', 'exists:ec_product_brands,id'],
            'is_featured' => ['nullable', 'boolean'],
        ];
    }

    public function attributes(): array
    {
        return [
            'brands.*' => trans('plugins/ecommerce::brands.brands'),
        ];
    }
}
