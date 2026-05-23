<?php

namespace Botble\Ecommerce\Http\Requests\API;

use Botble\Ecommerce\Models\Product;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CartRefreshRequest extends Request
{
    public function rules(): array
    {
        return [
            'products' => ['required', 'array'],
            'products.*.product_id' => [
                'required',
                'integer',
                Rule::exists(Product::class, 'id'),
            ],
            'products.*.quantity' => [
                'required',
                'integer',
                'min:1',
            ],
        ];
    }
}
