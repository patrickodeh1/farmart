<?php

namespace Botble\Ecommerce\Http\Resources\API;

use Botble\Ecommerce\Http\Resources\ProductOptionResource;
use Botble\Ecommerce\Models\Product;
use Botble\Media\Facades\RvMedia;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Product
 */
class AvailableProductResource extends JsonResource
{
    public function toArray($request): array
    {
        $price = $this->price();

        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'name' => $this->name,
            'sku' => $this->sku,
            'description' => $this->description,
            'content' => $this->content,
            'quantity' => $this->quantity,
            'is_out_of_stock' => $this->isOutOfStock(),
            'stock_status_label' => $this->stock_status_label,
            'stock_status_html' => $this->stock_status_html,
            'price' => $price->getPrice(),
            'price_formatted' => $price->displayAsText(),
            'original_price' => $price->getPriceOriginal(),
            'original_price_formatted' => $price->displayPriceOriginalAsText(),
            'reviews_avg' => $this->reviews_avg,
            'reviews_count' => $this->reviews_count,
            'image_with_sizes' => $this->images ? rv_get_image_list($this->images, array_unique([
                'origin',
                'thumb',
                ...array_keys(RvMedia::getSizes()),
            ])) : null,
            'weight' => $this->weight,
            'height' => $this->height,
            'wide' => $this->wide,
            'length' => $this->length,
            'image_url' => RvMedia::getImageUrl($this->image, 'thumb', false, RvMedia::getDefaultImage()),
            $this->mergeWhen(! $this->is_variation, function () {
                return [
                    'product_options' => ProductOptionResource::collection($this->original_product->options),
                ];
            }),
            $this->mergeWhen($this->is_variation, function () {
                return [
                    'variation_attributes' => $this->variation_attributes,
                ];
            }),
            $this->mergeWhen(is_plugin_active('marketplace'), function () {
                $store = $this->original_product->store;

                return [
                    'store' => [
                        'id' => $store?->id,
                        'slug' => $store?->slugable?->key,
                        'name' => $store?->name,
                    ],
                ];
            }),
        ];
    }
}
