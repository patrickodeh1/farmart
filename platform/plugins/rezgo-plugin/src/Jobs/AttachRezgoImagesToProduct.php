<?php

namespace Botble\RezgoConnector\Jobs;

use Botble\Ecommerce\Models\Product;
use Botble\RezgoConnector\Models\RezgoLog;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use RvMedia;

class AttachRezgoImagesToProduct implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected int $productId;
    protected array $photoUrls;

    public function __construct(int $productId, array $photoUrls)
    {
        $this->productId = $productId;
        $this->photoUrls = $photoUrls;
    }

    public function handle(): void
    {
        $product = Product::find($this->productId);
        if (!$product) {
            Log::error('AttachRezgoImagesToProduct: Product not found', ['product_id' => $this->productId]);
            return;
        }

        Log::info('AttachRezgoImagesToProduct: starting async image attachment', [
            'product_id'   => $this->productId,
            'photos_count' => count($this->photoUrls),
            'urls'         => $this->photoUrls,
        ]);

        $imageUrls = [];
        $isFirst   = true;

        foreach ($this->photoUrls as $index => $url) {
            try {
                Log::info('AttachRezgoImagesToProduct: Uploading image from Rezgo via RvMedia', [
                    'url'   => $url,
                    'index' => $index,
                    'product_id' => $this->productId,
                ]);

                $path = RvMedia::uploadFromUrl($url, 'products');

                // Handle case where RvMedia returns an array instead of string
                $uploadPath = $path;
                if (is_array($path)) {
                    // Extract the actual path/url from the array response
                    $uploadPath = $path['url'] ?? $path['path'] ?? reset($path);
                }

                Log::info('Image uploaded successfully via RvMedia', [
                    'url'         => $uploadPath,
                    'media_id'    => null,
                    'filename'    => basename($uploadPath),
                    'mime_type'   => 'image/jpeg',
                ]);

                $imageUrls[] = $uploadPath;

                // Set as featured image on first one
                if ($isFirst) {
                    $product->image = $uploadPath;
                    $product->save();
                    Log::info('Set featured image on product', [
                        'product_id'  => $product->id,
                        'image_field' => $uploadPath,
                    ]);
                    $isFirst = false;
                }
            } catch (\Exception $e) {
                Log::error('Failed to upload image from Rezgo', [
                    'url'        => $url,
                    'error'      => $e->getMessage(),
                    'product_id' => $this->productId,
                ]);
            }
        }

        if (!empty($imageUrls)) {
            $gallery = [];
            if ($product->images) {
                $gallery = is_string($product->images) ? json_decode($product->images, true) : $product->images;
            }

            $allImages = array_merge($gallery ?: [], $imageUrls);
            $product->images = json_encode($allImages);
            $product->save();

            Log::info('Images successfully attached to product gallery', [
                'product_id'         => $this->productId,
                'new_image_urls'     => $imageUrls,
                'existing_images'    => $gallery ?: [],
                'all_images'         => $allImages,
                'count'              => count($allImages),
            ]);
        }
    }
}
