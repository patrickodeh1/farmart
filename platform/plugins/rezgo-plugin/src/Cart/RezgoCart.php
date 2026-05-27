<?php

namespace Botble\RezgoConnector\Cart;

use Botble\Ecommerce\Cart\Cart;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Services\HandleApplyProductCrossSaleService;
use Exception;

class RezgoCart extends Cart
{
    public function update(string $rowId, int|\Botble\Ecommerce\Cart\Contracts\Buyable|array $qty): bool|\Botble\Ecommerce\Cart\CartItem|null
    {
        $cartItem = $this->get($rowId);
        // Preserve Rezgo blended price — only allow qty changes, never price changes
        $rezgoBlended = 0.0;
        if ($cartItem) {
            $opts = $cartItem->options->toArray();
            $rezgoBlended = (float)($opts['extras']['rezgo_blended_price'] ?? 0);
        }
        $result = parent::update($rowId, $qty);
        if ($rezgoBlended > 0 && $result && is_object($result)) {
            // Re-fetch item (rowId may have changed after update)
            foreach ($this->content() as $currentRowId => $item) {
                if ((int)$item->id === (int)$cartItem->id) {
                    if ($item->price != $rezgoBlended) {
                        $opts = $item->options->toArray();
                        $this->removeQuietly($currentRowId);
                        $this->addQuietly(
                            $item->id,
                            $item->name,
                            $item->qty,
                            $rezgoBlended,
                            $opts
                        );
                    }
                    break;
                }
            }
        }
        return $result;
    }

    public function refresh(): void
    {
        $cart = $this->instance('cart');
        if ($cart->isEmpty()) {
            return;
        }

        $ids = $cart->content()->pluck('id')->toArray();
        $products = get_products([
            'condition' => [
                ['ec_products.id', 'IN', $ids],
            ],
        ]);

        if ($products->isEmpty()) {
            return;
        }

        foreach ($cart->content() as $rowId => $cartItem) {
            $product = $products->firstWhere('id', $cartItem->id);
            if (! $product || $product->original_product->status != BaseStatusEnum::PUBLISHED) {
                $this->remove($cartItem->rowId);
            } else {
                $cart->removeQuietly($rowId);
                $parentProduct = $product->original_product;
                $options = $cartItem->options->toArray();
                $options['image'] = $product->image ?: $parentProduct->image;
                $options['taxRate'] = $cartItem->getTaxRate();

                // For Rezgo items, preserve the stored blended price instead of
                // re-reading from DB, which loses the date-specific price.
                $rezgoBlendedPrice = (float)($options['extras']['rezgo_blended_price'] ?? 0);
                $price = $rezgoBlendedPrice > 0
                    ? $rezgoBlendedPrice
                    : $product->price()->getPrice(false);

                $cart->addQuietly(
                    $cartItem->id,
                    $cartItem->name,
                    $cartItem->qty,
                    $price,
                    $options
                );
            }
        }

        // Snapshot Rezgo blended prices before cross-sale service overwrites them
        $rezgoPrices = [];
        foreach ($cart->content() as $rowId => $cartItem) {
            $blended = (float)(($cartItem->options->toArray())['extras']['rezgo_blended_price'] ?? 0);
            if ($blended > 0) {
                $rezgoPrices[$rowId] = ['price' => $blended, 'item' => $cartItem];
            }
        }

        try {
            app(HandleApplyProductCrossSaleService::class)->handle();
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }

        // Restore Rezgo prices that cross-sale service may have overwritten
        foreach ($rezgoPrices as $rowId => $data) {
            // Find the item by id since rowId may have changed after removeQuietly/addQuietly
            foreach ($cart->content() as $currentRowId => $cartItem) {
                if ((int)$cartItem->id === (int)$data['item']->id) {
                    if ($cartItem->price != $data['price']) {
                        $options = $cartItem->options->toArray();
                        $cart->removeQuietly($currentRowId);
                        $cart->addQuietly(
                            $cartItem->id,
                            $cartItem->name,
                            $cartItem->qty,
                            $data['price'],
                            $options
                        );
                    }
                    break;
                }
            }
        }
    }
}
