<?php

namespace Botble\RezgoConnector\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\View;
use Botble\Base\Facades\DashboardMenu;
use Botble\Base\Supports\DashboardMenuItem;
use Botble\Ecommerce\Events\OrderPlacedEvent;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Log;

class RezgoConnectorServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        // Merge config from plugin
        $this->mergeConfigFrom(__DIR__ . '/../../config/rezgo.php', 'rezgo');

        // Register singleton services
        $this->app->singleton('rezgo.settings', function () {
            return new \Botble\RezgoConnector\Services\RezgoSettingsService();
        });

        $this->app->singleton('rezgo.api', function ($app) {
            return new \Botble\RezgoConnector\Services\RezgoApiService(
                $app->make(\Botble\RezgoConnector\Services\RezgoSettingsService::class)
            );
        });

        $this->app->singleton('rezgo.logger', function () {
            return new \Botble\RezgoConnector\Services\RezgoLoggerService();
        });

        $this->app->singleton('rezgo.external_sync', function ($app) {
            return new \Botble\RezgoConnector\Services\ExternalDatabaseSyncService(
                $app->make(\Botble\RezgoConnector\Services\RezgoApiService::class)
            );
        });
    }

    public function boot(): void
    {
        // Configure logging channel for Rezgo
        config(['logging.channels.rezgo' => [
            'driver' => 'daily',
            'path'   => storage_path('logs/rezgo-sync.log'),
            'level'  => 'debug',
            'days'   => 14,
        ]]);

        // Load migrations
        $this->loadMigrationsFrom(__DIR__ . '/../../database/migrations');

        // Load routes
        $this->loadRoutesFrom(__DIR__ . '/../../routes/web.php');

        // Load translations
        $this->loadTranslationsFrom(__DIR__ . '/../../resources/lang', 'rezgo');

        // Load views
        $this->loadViewsFrom(__DIR__ . '/../../resources/views', 'rezgo');

        // Register admin menu item if DashboardMenu is available
        if (class_exists('\Botble\Base\Facades\DashboardMenu')) {
            DashboardMenu::default()->beforeRetrieving(function (): void {
                DashboardMenu::make()
                    ->registerItem(
                        DashboardMenuItem::make()
                            ->id('rezgo-connector')
                            ->priority(50)
                            ->icon('ti ti-packages')
                            ->name('rezgo::messages.rezgo_connector')
                    );

                // Add main Settings submenu
                DashboardMenu::make()
                    ->registerItem(
                        DashboardMenuItem::make()
                            ->id('rezgo-settings')
                            ->priority(50)
                            ->parentId('rezgo-connector')
                            ->icon('ti ti-settings')
                            ->name('Settings')
                            ->route('rezgo.index')
                    );

                // Add Gate Price Settings submenu (formerly External Sync)
                DashboardMenu::make()
                    ->registerItem(
                        DashboardMenuItem::make()
                            ->id('rezgo-gate-price')
                            ->priority(51)
                            ->parentId('rezgo-connector')
                            ->icon('ti ti-refresh-dot')
                            ->name('Gate Price Settings')
                            ->route('rezgo.gate-price.settings')
                    );


            });
        }

        // Register commands
        if ($this->app->runningInConsole()) {
            $this->commands([
                \Botble\RezgoConnector\Commands\SetupRezgoTestData::class,
                \Botble\RezgoConnector\Commands\ClearRezgoMappings::class,
                \Botble\RezgoConnector\Commands\SyncRezgoPrices::class,
                \Botble\RezgoConnector\Commands\DebugRezgoInventory::class,
                \Botble\RezgoConnector\Commands\TestRezgoApi::class,
                \Botble\RezgoConnector\Commands\TestImageAttachment::class,
            ]);
        }

        // Inject Rezgo markup panel into product edit page
        add_action(BASE_ACTION_META_BOXES, function ($context, $object) {
            // Only show on product edit page in admin
            if ($object instanceof \Botble\Ecommerce\Models\Product && $context === 'advanced') {
                $product = $object;
                $mapping = \Botble\RezgoConnector\Models\RezgoProductMapping::getByProductId($product->id);
                if (!$mapping) return;
                echo view('rezgo::components.product-markup-box', [
                    'product' => $product,
                    'mapping' => $mapping,
                ])->render();
            }
        }, 10, 2);

        // Publish configuration
        $this->publishes(
            [__DIR__ . '/../../config' => config_path('rezgo')],
            'rezgo-config'
        );

        // Register filter to inject Rezgo calendar into product detail page ONLY
        add_filter('ecommerce_after_product_description', function ($content, $product = null) {
            // Product should be passed as second parameter
            if (!$product || !($product instanceof \Botble\Ecommerce\Models\Product)) {
                return $content;
            }

            $mapping = \Botble\RezgoConnector\Models\RezgoProductMapping::getByProductId($product->id);

            if ($mapping && $mapping->is_active) {
                // Return calendar widget appended to existing content
                return $content . view('rezgo::components.rezgo-calendar-widget', [
                    'product' => $product,
                    'mapping' => $mapping
                ])->render();
            }

            return $content;
        }, 10, 2);

        // Override product price with the Rezgo total the customer selected.
        // The widget computes grandTotal = (adult_qty * adult_price) + (child_qty * child_price)
        // and sends it as extras[rezgo_total] with qty=1.
        // We set $product->price = that total and enforce qty=1 so Farmart's
        // price * qty equals exactly what the customer saw in the calendar.
        add_action('ecommerce_before_add_to_cart', function ($product) {
            $request    = request();
            $rezgoUid   = $request->input('extras.rezgo_uid');
            $rezgoTotal = (float) $request->input('extras.rezgo_total', 0);

            if (!$rezgoUid || $rezgoTotal <= 0) {
                return; // Not a Rezgo product or no date selected — leave price alone
            }

            $product->price      = round($rezgoTotal, 2);
            $product->sale_price = null; // clear any sale price

            // qty is already 1 from the widget — enforce it here as well
            $request->merge(['qty' => 1]);
        });

        // Override the price Farmart reads from ProductPrice::getPrice() for Rezgo products.
        // add_action cannot override it because OrderHelper calls $product->price()->getPrice()
        // which goes through this filter — so we intercept here instead.
        add_filter('product_prices_price_value', function ($price, $product) {
            \Log::info('Rezgo price filter fired', ['price' => $price, 'rezgo_total' => request()->input('extras.rezgo_total'), 'rezgo_uid' => request()->input('extras.rezgo_uid'), 'request_id' => request()->input('id'), 'product_id' => $product->id]);
            $rezgoTotal = (float) request()->input('extras.rezgo_total', 0);
            $rezgoUid   = request()->input('extras.rezgo_uid');
            if (!$rezgoUid || $rezgoTotal <= 0) {
                return $price;
            }
            // Only override for the product being added to cart
            $requestProductId = (int) request()->input('id');
            if ($product->id !== $requestProductId) {
                return $price;
            }
            return round($rezgoTotal, 2);
        }, 10, 2);
        // After cart item is added, update its price to the Rezgo total.
        // The product_prices_price_value filter fires multiple times during add-to-cart
        // (for promotions, related products etc.) so it is unreliable for Cart::add().
        // Instead we find the just-added item by product ID and overwrite its price directly.
        add_filter('ecommerce_after_add_to_cart', function ($cartItems) {
            $rezgoTotal = (float) request()->input('extras.rezgo_total', 0);
            $rezgoUid   = request()->input('extras.rezgo_uid');
            $productId  = (int) request()->input('id');
            if (!$rezgoUid || $rezgoTotal <= 0 || !$productId) return $cartItems;
            $cart = \Botble\Ecommerce\Facades\Cart::instance('cart');
            $cart->content()->each(function ($item) use ($cart, $productId, $rezgoTotal) {
                if ((int)$item->id === $productId) {
                    $cart->update($item->rowId, ['price' => round($rezgoTotal, 2), 'qty' => 1]);
                }
            });
            return $cartItems;
        }, 10, 1);

        // Save Rezgo tour date and passenger data when order is placed
        Event::listen(OrderPlacedEvent::class, function ($event) {
            try {
                $order = $event->order;
                if (!$order || !$order->products) return;

                foreach ($order->products as $orderProduct) {
                    $extras = [];
                    if (!empty($orderProduct->options) && isset($orderProduct->options['extras'])) {
                        $extras = $orderProduct->options['extras'];
                    }

                    if (empty($extras['rezgo_uid'])) continue;

                    // Check if meta already exists for this order
                    $exists = \DB::table('rezgo_meta')
                        ->where('order_id', $order->id)
                        ->exists();

                    if ($exists) continue;

                    \DB::table('rezgo_meta')->insert([
                        'order_id'        => $order->id,
                        'rezgo_booking_id' => null,
                        'tour_uid'        => $extras['rezgo_uid'] ?? null,
                        'tour_title'      => $orderProduct->product_name ?? null,
                        'passenger_count' => ((int)($extras['rezgo_adult_qty'] ?? 1))
                                            + ((int)($extras['rezgo_child_qty'] ?? 0)),
                        'tour_date'       => $extras['rezgo_date'] ?? null,
                        'passenger_data'  => json_encode([
                            'adult_qty'   => (int)($extras['rezgo_adult_qty'] ?? 1),
                            'child_qty'   => (int)($extras['rezgo_child_qty'] ?? 0),
                            'adult_price' => (float)($extras['rezgo_price'] ?? 0),
                            'child_price' => (float)($extras['rezgo_child_price'] ?? 0),
                        ]),
                        'api_response'    => null,
                        'created_at'      => now(),
                        'updated_at'      => now(),
                    ]);
                }
            } catch (\Exception $e) {
                \Log::error('Rezgo: failed to save rezgo_meta on order placed: ' . $e->getMessage());
            }
        });
    }
}