<?php

namespace Botble\Ecommerce\Http\Resources\API;

use Botble\Ecommerce\Models\Order;
use Botble\Media\Facades\RvMedia;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Arr;

/**
 * @mixin Order
 */
class OrderDetailResource extends JsonResource
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
            'products' => $this->getProductData(),
            'discount_amount' => $this->discount_amount,
            'discount_amount_formatted' => format_price($this->discount_amount),
            'discount_description' => $this->discount_description,
            'coupon_code' => $this->coupon_code,
            'can_be_canceled' => $this->resource->canBeCanceled(),
            'can_confirm_delivery' => $this->shipment->can_confirm_delivery,
            'is_invoice_available' => $this->resource->isInvoiceAvailable(),
            'can_be_returned' => $this->resource->canBeReturned(),
            'invoice_links' => [
                'print' => $this->resource->isInvoiceAvailable()
                    ? route('customer.print-order', $this->resource->id) . '?type=print'
                    : null,
                'download' => $this->resource->isInvoiceAvailable()
                    ? route('customer.print-order', $this->resource->id)
                    : null,
            ],
        ];
    }

    private function getProductData()
    {
        // Get all original products info
        $originalProducts = $this->getOrderProducts();

        return $this->products->map(function ($product) use ($originalProducts) {
            // Find corresponding original product
            $originalProduct = $originalProducts->firstWhere('id', $product->product_id);

            $item = [
                'id' => $product->id,
                'product_id' => $product->product_id,
                'product_name' => $product->product_name,
                'product_image' => RvMedia::getImageUrl($product->product_image, 'thumb', false, RvMedia::getDefaultImage()),
                'product_url' => $originalProduct?->original_product?->url,
                'sku' => Arr::get($product->options, 'sku'),
                'attributes' => Arr::get($product->options, 'attributes'),
                'amount' => $product->price,
                'amount_formatted' => $product->amount_format,
                'quantity' => $product->qty,
                'total' => $product->price * $product->qty,
                'total_formatted' => $product->total_format,
                'options' => $product->options,
                'product_options' => $product->product_options,
            ];

            // Add variation attributes if product is variation
            if ($originalProduct && $originalProduct->is_variation) {
                $item['variation_attributes'] = get_product_attributes($originalProduct->id)->map(function ($attribute) {
                    return [
                        'attribute_set_title' => $attribute->attribute_set_title,
                        'title' => $attribute->title,
                        'color' => $attribute->color,
                        'image' => $attribute->image,
                    ];
                });
            }

            // Add marketplace store information if available
            if (
                is_plugin_active('marketplace') &&
                ($originalProduct?->original_product?->store?->id)
            ) {
                $item['sold_by'] = [
                    'store_name' => $originalProduct->original_product->store->name,
                    'store_url' => $originalProduct->original_product->store->url,
                ];
            }

            return $item;
        });
    }
}
