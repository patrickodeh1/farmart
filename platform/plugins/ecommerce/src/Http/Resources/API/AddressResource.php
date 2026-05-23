<?php

namespace Botble\Ecommerce\Http\Resources\API;

use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\Address;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Address
 */
class AddressResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'is_default' => $this->is_default,
            'phone' => $this->phone,
            'email' => $this->email,
            'country' => EcommerceHelper::getCountryNameById($this->country),
            'state' => $this->state,
            'city' => $this->city,
            'address' => $this->address,
            'zip_code' => $this->zip_code,
            'full_address' => $this->full_address,
        ];
    }
}
