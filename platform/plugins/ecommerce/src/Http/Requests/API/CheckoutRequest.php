<?php

namespace Botble\Ecommerce\Http\Requests\API;

use Illuminate\Foundation\Http\FormRequest;

class CheckoutRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'cart_items' => ['required', 'array'],
            'cart_items.*.id' => ['required', 'exists:products,id'],
            'cart_items.*.quantity' => ['required', 'integer', 'min:1'],
            'shipping_address' => ['required', 'array'],
            'shipping_address.name' => ['required', 'string'],
            'shipping_address.address' => ['required', 'string'],
            'shipping_address.city' => ['required', 'string'],
            'shipping_address.country' => ['required', 'string'],
            'shipping_address.postcode' => ['required', 'string'],
            'payment_method' => ['required', 'string', 'in:credit_card,paypal,bank_transfer'], // Thêm các phương thức thanh toán khác nếu cần
        ];
    }
}
