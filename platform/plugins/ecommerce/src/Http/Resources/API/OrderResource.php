<?php

namespace Botble\Ecommerce\Http\Resources\API;

use Botble\Ecommerce\Models\Order;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Order
 */
class OrderResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'status' => $this->status,
            'status_html' => $this->status->toHtml(),
            'customer' => [
                'name' => $this->user->name,
                'email' => $this->user->email,
                'phone' => $this->user->phone,
            ],
            'created_at' => $this->created_at->translatedFormat('Y-m-d\TH:i:sP'),
            'amount' => $this->amount,
            'amount_formatted' => format_price($this->amount),
            'tax_amount' => $this->tax_amount,
            'tax_amount_formatted' => format_price($this->tax_amount),
            'shipping_amount' => $this->shipping_amount,
            'shipping_amount_formatted' => format_price($this->shipping_amount),
            'shipping_method' => $this->shipping_method,
            'shipping_status' => $this->shipment->status,
            'shipping_status_html' => $this->shipment->status->toHtml(),
            'payment_method' => $this->payment->payment_channel,
            'payment_status' => $this->payment->status,
            'payment_status_html' => $this->payment->status->toHtml(),
        ];
    }
}
