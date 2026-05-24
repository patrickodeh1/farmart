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

        // Rebind Cart with our subclass that preserves Rezgo prices during refresh()
        $this->app->singleton(\Botble\Ecommerce\Cart\Cart::class, function ($app) {
            $cart = new \Botble\RezgoConnector\Cart\RezgoCart(
                $app['session'],
                $app['events']
            );
            return $cart;
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
        // The widget sends extras[rezgo_total] (grandTotal) and extras[rezgo_blended_price]
        // (grandTotal / totalTickets). The filter intercepts getPrice() calls and returns
        // the blended price. RezgoCart::refresh() preserves it across requests.
        add_action('ecommerce_before_add_to_cart', function ($product) {
            $request    = request();
            $rezgoUid   = $request->input('extras.rezgo_uid');
            $rezgoTotal = (float) $request->input('extras.rezgo_total', 0);
            $rezgoDate  = $request->input('extras.rezgo_date');

            // Check if this is a Rezgo product by looking up the mapping
            $mapping = \Botble\RezgoConnector\Models\RezgoProductMapping::where('product_id', $product->id)
                ->where('is_active', true)
                ->first();

            // Block add to cart for Rezgo products without a date selected
            if ($mapping && empty($rezgoDate)) {
                throw new \Exception(__('Please select a tour date before adding to cart.'));
            }

            if (!$rezgoUid || $rezgoTotal <= 0) {
                return; // Not a Rezgo product or no date selected — leave price alone
            }

            // Widget sends blended price (grandTotal / totalTickets) and qty = totalTickets
            // so Farmart's price * qty = grandTotal exactly, and cart shows correct qty.
            $blendedPrice = (float) $request->input('extras.rezgo_blended_price', $rezgoTotal);
            $totalTickets = (int) $request->input('extras.rezgo_adult_qty', 1)
                          + (int) $request->input('extras.rezgo_child_qty', 0);
            if ($totalTickets < 1) $totalTickets = 1;
            $roundedBlended = round($blendedPrice, 2);
            $productId      = $product->id;


            $product->price            = $roundedBlended;
            $product->sale_price       = null;
            $product->front_sale_price = $roundedBlended;
            $request->merge(['qty' => $totalTickets]);
        });

        // Override the price Farmart reads from ProductPrice::getPrice() for Rezgo products.
        // add_action cannot override it because OrderHelper calls $product->price()->getPrice()
        // which goes through this filter — so we intercept here instead.
        add_filter('product_prices_price_value', function ($price, $product) {
            $rezgoTotal = (float) request()->input('extras.rezgo_total', 0);
            $rezgoUid   = request()->input('extras.rezgo_uid');

            // Primary path: live add-to-cart request has rezgo_total in POST data
            if ($rezgoUid && $rezgoTotal > 0) {
                $requestProductId = (int) request()->input('id');
                if ($product->id === $requestProductId) {
                    return round($rezgoTotal, 2);
                }
            }

            // Secondary path: Cart::refresh() and checkout re-read prices from DB.
            // Session stores CartItem objects — access as object properties.
            $cartSession = session()->get('cart.cart', []);
            foreach ($cartSession as $item) {
                if ((int)$item->id === (int)$product->id) {
                    $extras = is_array($item->options) ? $item->options['extras'] ?? [] : $item->options->extras ?? [];
                    $savedPrice = (float)($extras['rezgo_blended_price'] ?? 0);
                    if ($savedPrice > 0) {
                        return round($savedPrice, 2);
                    }
                }
            }
            return $price;
        }, 10, 2);


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