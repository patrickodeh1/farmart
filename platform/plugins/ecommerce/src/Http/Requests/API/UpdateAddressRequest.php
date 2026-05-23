<?php

namespace Botble\Ecommerce\Http\Requests\API;

use Botble\Ecommerce\Models\Address;
use Botble\Support\Http\Requests\Request;

class UpdateAddressRequest extends Request
{
    public function authorize(): bool
    {
        $address = Address::findOrFail($this->route('id'));

        return $address && $address->customer_id === $this->user()->id;
    }

    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:60'],
            'phone' => ['required', 'regex:/^([0-9\s\-\+\(\)]*)$/', 'min:9', 'max:15'],
            'country' => ['required', 'string', 'max:120'],
            'state' => ['required', 'string', 'max:120'],
            'city' => ['required', 'string', 'max:120'],
            'address' => ['required', 'string', 'max:255'],
            'is_default' => ['boolean'],
            'zip_code' => ['nullable', 'string', 'max:20'],
        ];
    }

}
