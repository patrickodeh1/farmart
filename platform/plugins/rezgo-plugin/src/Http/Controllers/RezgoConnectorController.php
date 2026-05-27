<?php

namespace Botble\RezgoConnector\Http\Controllers;

use Botble\Base\Http\Controllers\BaseController;
use Botble\RezgoConnector\Http\Requests\UpdateRezgoSettingsRequest;
use Botble\RezgoConnector\Models\{RezgoSubmission, RezgoProductMapping, RezgoLog};
use Botble\RezgoConnector\Services\{RezgoSettingsService, RezgoApiService, ExternalDatabaseSyncService, ExternalDatabaseConfigService};
use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Illuminate\Http\{RedirectResponse, JsonResponse};
use Botble\Ecommerce\Models\Product;

class RezgoConnectorController extends BaseController
{
    private RezgoSettingsService $settings;
    private RezgoApiService $api;
    private ExternalDatabaseSyncService $externalSync;

    public function __construct(RezgoSettingsService $settings, RezgoApiService $api, ExternalDatabaseSyncService $externalSync)
    {
        $this->settings     = $settings;
        $this->api          = $api;
        $this->externalSync = $externalSync;
    }

    public function index(): View
    {
        return view('rezgo::admin.settings', [
            'settings'          => $this->settings->all(),
            'decrypted_cid'     => $this->settings->getCid(),
            'decrypted_api_key' => $this->settings->getApiKey(),
            'submissionsCount'  => RezgoSubmission::count(),
            'successCount'      => RezgoSubmission::where('status', 'success')->count(),
            'failedCount'       => RezgoSubmission::where('status', 'failed')->count(),
            'mappingsCount'     => RezgoProductMapping::where('is_active', true)->count(),
            'recentLogs'        => RezgoLog::latest()->limit(10)->get(),
        ]);
    }

    public function updateSettings(UpdateRezgoSettingsRequest $request): RedirectResponse
    {
        $this->settings->setCid($request->input('rezgo_cid'));
        $this->settings->setApiKey($request->input('rezgo_api_key'));
        $this->settings->set('default_passenger_type', $request->input('default_passenger_type', 'adult'));
        $this->settings->set('booking_date_offset', (int)$request->input('booking_date_offset', 1));
        $this->settings->set('sync_enabled', (bool)$request->input('sync_enabled', false));

        return back()->with('success', __('Settings updated successfully'));
    }

    public function submissions(): View
    {
        $submissions = RezgoSubmission::with('order')->latest()->paginate(20);
        return view('rezgo::admin.submissions', ['submissions' => $submissions]);
    }

    public function submissionDetail(int $id): View
    {
        $submission = RezgoSubmission::with('order')->findOrFail($id);
        return view('rezgo::admin.submission-detail', ['submission' => $submission]);
    }

    public function showSubmitOrderForm(): View
    {
        $orderIds   = \DB::table('ec_orders')->orderBy('id', 'desc')->limit(100)->pluck('id');
        $ordersData = [];

        foreach ($orderIds as $orderId) {
            $order    = \DB::table('ec_orders')->where('id', $orderId)->first();
            $customer = \DB::table('ec_customers')->find($order->user_id);
            $products = \DB::table('ec_order_product')->where('order_id', $orderId)->get();
            $orderedProducts = [];
            $orderTotal = 0;

            foreach ($products as $product) {
                $productModel = \Botble\Ecommerce\Models\Product::find($product->product_id);
                $mapping     = \DB::table('rezgo_product_mappings')
                    ->where('product_id', $product->product_id)
                    ->where('is_active', true)
                    ->first();

                // Read what the customer actually paid from order_product options/extras
                $productOptions = [];
                if (!empty($product->options)) {
                    $productOptions = is_string($product->options) ? json_decode($product->options, true) : (array)$product->options;
                }
                $extras = $productOptions['extras'] ?? [];
                $customerTotal      = (float)($extras['rezgo_total'] ?? 0);
                $customerAdultPrice = (float)($extras['rezgo_price'] ?? 0);
                $customerChildPrice = (float)($extras['rezgo_child_price'] ?? 0);
                $customerAdultQty   = (int)($extras['rezgo_adult_qty'] ?? 0);
                $customerChildQty   = (int)($extras['rezgo_child_qty'] ?? 0);

                // Display price: what customer paid, fallback to markup price
                $displayPrice = $customerTotal > 0 ? $customerTotal : ($mapping ? $mapping->rezgo_price : ($productModel ? $productModel->price : 0));
                $orderTotal += $displayPrice;

                $orderedProducts[] = [
                    'product_id'        => $product->product_id,
                    'product_name'      => $productModel ? $productModel->name : 'Unknown',
                    'product_price'     => $productModel ? $productModel->price : 0,
                    'quantity'          => $product->quantity ?? 1,
                    'rezgo_uid'         => $mapping ? $mapping->rezgo_uid : null,
                    'rezgo_tour'        => $mapping ? $mapping->rezgo_uid : null,
                    'rezgo_title'       => $mapping ? $mapping->rezgo_title : null,
                    'rezgo_price'       => $displayPrice,
                    'rezgo_adult_price' => $customerAdultPrice,
                    'rezgo_child_price' => $customerChildPrice,
                    'rezgo_adult_qty'   => $customerAdultQty,
                    'rezgo_child_qty'   => $customerChildQty,
                    'passenger_type'    => $mapping ? $mapping->passenger_type : null,
                    'mapped'            => $mapping ? true : false,
                    'availability'      => 0,
                ];
            }

            $ordersData[] = [
                'id'            => $orderId,
                'user_id'       => $order->user_id,
                'customer_name' => $customer ? $customer->name : null,
                'total'         => $orderTotal > 0 ? $orderTotal : ($order->total ?? 0),
                'created_at'    => $order->created_at ?? null,
                'products'      => $orderedProducts,
            ];
        }


        // Load tour dates from rezgo_meta (FIX 2 & 3)
        $rezgoMeta = \DB::table('rezgo_meta')
            ->whereIn('order_id', collect($ordersData)->pluck('id')->toArray())
            ->get()
            ->keyBy('order_id');

        return view('rezgo::admin.submit-order', [
            'orders'    => $ordersData,
            'rezgoMeta' => $rezgoMeta,
        ]);
    }

    // FIX: implemented server-side pagination for inventory (15 items per page)
    public function productMappings(): View
    {
        $mappings            = RezgoProductMapping::with('product')->paginate(20);
        $products            = \DB::table('ec_products')->orderBy('name')->get();
        $rezgoTours          = [];
        $totalInventoryCount = 0;
        $inventoryError      = null;
        $currentPage         = (int) request()->query('rezgo_page', 1);
        $perPage             = 15;

        try {
            $inventoryResponse = $this->api->searchInventory();

            if ($inventoryResponse['success'] && isset($inventoryResponse['data']['item'])) {
                $items = $inventoryResponse['data']['item'];
                // Normalize to array
                if (!is_array($items) || !isset($items[0])) {
                    $items = [$items];
                }

                $totalInventoryCount = count($items);
                // Server-side pagination: calculate offset and slice
                $offset = ($currentPage - 1) * $perPage;
                $slice  = array_slice($items, $offset, $perPage);

                // Normalize display_name for each
                foreach ($slice as &$item) {
                    $item['display_name'] = $item['name'] ?? $item['item'] ?? $item['uid'] ?? 'Unknown';
                }

                $rezgoTours = $slice;

            } elseif (!$inventoryResponse['success']) {
                $inventoryError = $inventoryResponse['error'] ?? 'Unknown API error';
                RezgoLog::error('product_mappings', null, 'Inventory fetch failed: ' . $inventoryError);
            }
        } catch (\Exception $e) {
            $inventoryError = $e->getMessage();
            RezgoLog::error('product_mappings', null, 'Exception fetching inventory: ' . $e->getMessage());
        }

        return view('rezgo::admin.product-mappings', [
            'mappings'            => $mappings,
            'products'            => $products,
            'rezgoTours'          => $rezgoTours,
            'totalInventoryCount' => $totalInventoryCount,
            'currentPage'         => $currentPage,
            'perPage'             => $perPage,
            'inventoryError'      => $inventoryError,
        ]);
    }

    public function saveProductMapping(\Illuminate\Http\Request $request): RedirectResponse
    {
        $request->validate([
            'product_id'     => 'required|exists:ec_products,id',
            'rezgo_uid'      => 'required|string',
            'rezgo_title'    => 'nullable|string',
            'passenger_type' => 'required|in:adult,child,senior',
            'markup_type'    => 'nullable|in:percent,fixed',
            'markup_value'   => 'nullable|numeric|min:0',
        ]);

        if ($request->filled('mapping_id')) {
            $mapping = RezgoProductMapping::findOrFail($request->mapping_id);
            $updates = [
                'product_id'     => $request->product_id,
                'rezgo_uid'      => $request->rezgo_uid,
                'rezgo_title'    => $request->rezgo_title,
                'passenger_type' => $request->passenger_type,
                'is_active'      => true,
            ];
            
            // Handle markup settings
            if ($request->filled('markup_type')) {
                $updates['markup_type'] = $request->markup_type;
            }
            if ($request->filled('markup_value')) {
                $updates['markup_value'] = (float)$request->markup_value;
            }
            
            $mapping->update($updates);
            // Update ec_products.price to reflect the new markup
            $savedType  = $mapping->fresh()->markup_type;
            $savedValue = (float)$mapping->fresh()->markup_value;
            $rezgoPrice = (float)$mapping->fresh()->rezgo_price;
            $newPrice   = $savedType === 'percent'
                ? round($rezgoPrice * (1 + $savedValue / 100), 2)
                : round($rezgoPrice + $savedValue, 2);
            \Botble\Ecommerce\Models\Product::where('id', $mapping->product_id)->update(['price' => $newPrice]);
            $mappingData = $mapping->toArray();
        } else {
            $createData = [
                'product_id'     => $request->product_id,
                'rezgo_uid'      => $request->rezgo_uid,
                'rezgo_title'    => $request->rezgo_title,
                'passenger_type' => $request->passenger_type,
                'is_active'      => true,
            ];
            
            // Add markup settings if provided
            if ($request->filled('markup_type')) {
                $createData['markup_type'] = $request->markup_type;
            }
            if ($request->filled('markup_value')) {
                $createData['markup_value'] = (float)$request->markup_value;
            }
            
            $mapping = RezgoProductMapping::updateOrCreate(
                ['product_id' => $request->product_id],
                $createData
            );
            $mappingData = $mapping->toArray();
            // Update ec_products.price to reflect the new markup (create/update branch)
            $savedType  = $mapping->fresh()->markup_type;
            $savedValue = (float)$mapping->fresh()->markup_value;
            $rezgoPrice = (float)$mapping->fresh()->rezgo_price;
            $newPrice   = $savedType === 'percent'
                ? round($rezgoPrice * (1 + $savedValue / 100), 2)
                : round($rezgoPrice + $savedValue, 2);
            \Botble\Ecommerce\Models\Product::where('id', $mapping->product_id)->update(['price' => $newPrice]);
        }

        // FIX: use config() not env()
        if (config('rezgo.rezgo.external_sync.enabled', false)) {
            $this->externalSync->syncMappingToExternal($mappingData);
        }

        return back()->with('success', __('Product mapping saved successfully'));
    }

    public function deleteProductMapping(int $id): RedirectResponse
    {
        $mapping  = RezgoProductMapping::findOrFail($id);
        $rezgoUid = $mapping->rezgo_uid;
        $mapping->delete();

        if (config('rezgo.rezgo.external_sync.enabled', false)) {
            $this->externalSync->deleteMappingFromExternal($rezgoUid);
        }

        return back()->with('success', __('Product mapping deleted'));
    }

    public function logs(): View
    {
        $logs = RezgoLog::latest()->paginate(50);
        return view('rezgo::admin.logs', ['logs' => $logs]);
    }

    public function testConnection(): RedirectResponse
    {
        if (!$this->settings->isConfigured()) {
            return back()->with('error', __('Rezgo API not configured'));
        }
        $response = $this->api->getCompanyInfo();
        if ($response['success']) {
            $companyName = $response['data']['company_name'] ?? 'Unknown';
            return back()->with('success', __("Connection successful! Company: {$companyName}"));
        }
        return back()->with('error', __('Connection failed: ' . $response['error']));
    }

    public function syncInventory(): \Illuminate\Contracts\View\View {
        $tours = [];
        $error = null;

        if ($this->settings->isConfigured()) {
            $response = $this->api->searchInventory();
            if ($response['success']) {
                $items = $response['data']['item'] ?? [];
                // Normalise single item vs array
                if (!empty($items) && isset($items['uid'])) {
                    $items = [$items];
                }
                $tours = $items;
            } else {
                $error = $response['error'] ?? 'Failed to load inventory';
            }
        }

        // Get all already-imported UIDs for badge display
        $importedUids = \Botble\RezgoConnector\Models\RezgoProductMapping::pluck('rezgo_uid')
            ->toArray();

        return view('rezgo::admin.settings', [
            'settings'          => $this->settings->all(),
            'decrypted_cid'     => $this->settings->getCid(),
            'decrypted_api_key' => $this->settings->getApiKey(),
            'submissionsCount'  => RezgoSubmission::count(),
            'successCount'      => RezgoSubmission::where('status', 'success')->count(),
            'failedCount'       => RezgoSubmission::where('status', 'failed')->count(),
            'mappingsCount'     => RezgoProductMapping::where('is_active', true)->count(),
            'recentLogs'        => RezgoLog::latest()->limit(10)->get(),
            'tours'             => $tours,
            'importedUids'      => $importedUids,
            'syncError'         => $error,
        ]);
    }

    public function submitOrder(\Illuminate\Http\Request $request): RedirectResponse
    {
        $orderId  = $request->input('order_id');
        $tourDate = $request->input('tour_date');

        if (!$orderId)  return back()->with('error', __('Order ID required'));
        if (!$tourDate) return back()->with('error', __('Tour date required'));

        try {
            $bookingDate = Carbon::createFromFormat('Y-m-d', $tourDate);
            if ($bookingDate->isPast()) {
                return back()->with('error', __('Tour date must be in the future'));
            }
        } catch (\Exception $e) {
            return back()->with('error', __('Invalid tour date format'));
        }

        $order = \DB::table('ec_orders')->where('id', $orderId)->first();
        if (!$order) return back()->with('error', __('Order not found'));

        $orderProducts = \DB::table('ec_order_product')->where('order_id', $orderId)->get();
        if ($orderProducts->isEmpty()) return back()->with('error', __('Order has no products'));

        $customer = \DB::table('ec_customers')->find($order->user_id);
        if (!$customer) return back()->with('error', __('Customer not found'));

        // Load meta to get saved passenger counts from customer selection
        $meta = \DB::table('rezgo_meta')->where('order_id', $orderId)->first();
        $passengerData = $meta ? json_decode($meta->passenger_data, true) : null;

        // Use saved passenger counts if available, otherwise fall back to product quantities
        if ($passengerData) {
            $adultsCount   = (int)($passengerData['adult_qty'] ?? 1);
            $childrenCount = (int)($passengerData['child_qty'] ?? 0);
            $seniorsCount  = 0;
            $tourUid       = $meta->tour_uid;
        } else {
            // Fallback: calculate from product mappings (original logic)
            $adultsCount = $childrenCount = $seniorsCount = 0;
            $tourUid = null;

            foreach ($orderProducts as $product) {
                $mapping = \DB::table('rezgo_product_mappings')
                    ->where('product_id', $product->product_id)
                    ->where('is_active', true)
                    ->first();

                if (!$mapping) {
                    return back()->with('error', __("Product {$product->product_id} has no Rezgo mapping"));
                }

                if (!$tourUid) $tourUid = $mapping->rezgo_uid;

                $qty = (int)($product->qty ?? 1);
                switch ($mapping->passenger_type) {
                    case 'child':
                        $childrenCount += $qty;
                        break;
                    case 'senior':
                        $seniorsCount += $qty;
                        break;
                    default:
                        $adultsCount += $qty;
                        break;
                }
            }
        }

        $bookingData = [
            'order_id'           => $orderId,
            'book'               => $tourUid,
            'date'               => $tourDate,
            'adult_num'          => $adultsCount,
            'child_num'          => $childrenCount,
            'senior_num'         => $seniorsCount,
            'tour_first_name'    => $customer->name ?? 'Customer',
            'tour_last_name'     => 'Order-' . $orderId,
            'tour_email_address' => $customer->email ?? 'noemail@test.com',
            'tour_phone_number'  => $customer->phone ?? '555-0000',
            'tour_address_1'     => $customer->address ?? '123 Main St',
            'tour_city'          => $customer->city ?? 'Orlando',
            'tour_stateprov'     => $customer->province ?? 'FL',
            'tour_country'       => $customer->country ?? 'US',
            'tour_postal_code'   => $customer->zip_code ?? '12345',
        ];

        $response = $this->api->commitBooking($bookingData);

        if ($response['success']) {
            $transNum = $response['trans_num'] ?? null;
            RezgoSubmission::updateOrCreate(
                ['order_id' => $orderId],
                [
                    'status'           => 'success',
                    'rezgo_booking_id' => $transNum,
                    'http_status'      => 201,
                    'error_message'    => null,
                ]
            );
            return back()->with('success', __("Order submitted to Rezgo successfully! Transaction: {$transNum}"));
        }

        $fullError = ($response['error'] ?? 'Unknown error') . ($response['error_code'] ? ' [' . $response['error_code'] . ']' : '');
        RezgoSubmission::updateOrCreate(
            ['order_id' => $orderId],
            [
                'status'           => 'failed',
                'rezgo_booking_id' => null,
                'http_status'      => $response['status'] ?? 0,
                'error_message'    => $fullError,
            ]
        );
        return back()->with('error', __('Submission failed: ' . $fullError));
    }

    /**
     * FIX: now calls getItemFull() (instruction=item) to get full description,
     * images, and price. Slug generated and made unique. SKU left null.
     * Redirects to product edit page after creation.
     */
    public function importAsDraft(\Illuminate\Http\Request $request): RedirectResponse
    {
        $request->validate([
            'rezgo_uid'   => 'required|string',
            'rezgo_title' => 'required|string',
        ]);

        $rezgoUid   = $request->input('rezgo_uid');
        $rezgoTitle = $request->input('rezgo_title');

        try {
            $richContent      = '';
            $shortDescription = $rezgoTitle;
            $rezgoPrice       = 0.00;
            $photoUrls        = [];

            $itemResponse = $this->api->getItemFull($rezgoUid);

            if ($itemResponse['success'] && !empty($itemResponse['data'])) {
                $itemData = $itemResponse['data'];
                $richContent = $this->api->extractDescription($itemData);
                $rezgoPrice  = $this->api->extractPrice($itemData, $rezgoUid);  // Pass UID for dynamic pricing fallback
                $photoUrls   = $this->api->extractPhotoUrls($itemData);
                \Log::info('Rezgo importAsDraft: extracted data', [
                    'uid'          => $rezgoUid,
                    'price'        => $rezgoPrice,
                    'photos_count' => count($photoUrls),
                    'photo_urls'   => $photoUrls,
                    'desc_length'  => strlen($richContent),
                    'item_keys'    => array_keys($itemData),
                ]);
            } else {
                \Log::warning('Rezgo importAsDraft: getItemFull() failed', [
                    'uid'       => $rezgoUid,
                    'error'     => $itemResponse['error'] ?? 'unknown',
                    'response'  => $itemResponse,
                ]);
            }

            // Create draft product (slug will be auto-generated by Botble system)
            $product               = new \Botble\Ecommerce\Models\Product();
            $product->name         = $rezgoTitle;
            $product->description  = $shortDescription;  // short summary for listing cards
            $product->content      = $richContent;        // full HTML body on product page
            $product->status       = 'draft';
            $product->is_variation = false;
            $product->sku          = null;
            $product->price        = $rezgoPrice;
            $product->quantity     = 1;
            $product->weight       = 0;
            $product->wide         = 0;
            $product->height       = 0;
            $product->length       = 0;
            $product->tax_id       = null;
            $product->store_id     = 1;
            $product->save();

            // Update product with real price (extractPrice has 90-day fallback built in)
            $product->price = $rezgoPrice;
            $product->save();

            // Mapping with price and default markup
            RezgoProductMapping::create([
                'product_id'     => $product->id,
                'rezgo_uid'      => $rezgoUid,
                'rezgo_title'    => $rezgoTitle,
                'rezgo_price'    => $rezgoPrice,
                'passenger_type' => 'adult',
                'markup_type'    => 'percent',
                'markup_value'   => 10.00,  // Default 10% markup
                'is_active'      => true,
            ]);

            // Attach images inline using correct RvMedia signature (Option B)
            if (!empty($photoUrls)) {
                $this->attachRezgoImages($product, $photoUrls);
                $imageNote = ' (images attached successfully)';
            } else {
                $imageNote = '';
            }

            return redirect()
                ->route('products.edit', $product->id)
                ->with('success', __(
                    'Product created as draft: ' . $rezgoTitle . $imageNote
                ));

        } catch (\Exception $e) {
            \Log::error('Rezgo importAsDraft error: ' . $e->getMessage(), [
                'file'  => $e->getFile(),
                'line'  => $e->getLine(),
            ]);
            return back()->with('error', __('Import failed: ') . $e->getMessage());
        }
    }

    public function showExternalSyncSettings(): View
    {
        $host = config('rezgo.external_sync.host', '');
        $port = config('rezgo.external_sync.port', '3306');
        $username = config('rezgo.external_sync.username', '');
        $database = config('rezgo.external_sync.database_name', '');
        $enabled = config('rezgo.external_sync.enabled', false);

        \Log::info('showExternalSyncSettings called', [
            'enabled'  => $enabled,
            'enabled_type' => gettype($enabled),
            'host'     => $host,
            'username' => $username,
            'database' => $database,
            'config_rezgo' => config('rezgo.external_sync'),
        ]);

        // Test the connection if configured
        $connectionStatus = null;
        if ($enabled && $host && $username && $database) {
            $credentials = [
                'host'     => $host,
                'port'     => $port,
                'username' => $username,
                'password' => config('rezgo.external_sync.password'),
                'database' => $database,
            ];
            $testResult = ExternalDatabaseConfigService::testConnection($credentials);
            if ($testResult['success']) {
                $connectionStatus = ExternalDatabaseConfigService::testDatabaseAccess($credentials);
            } else {
                $connectionStatus = $testResult;
            }
        }

        return view('rezgo::admin.external-sync-settings', [
            'host'     => $host,
            'port'     => $port,
            'username' => $username,
            'database' => $database,
            'enabled'  => $enabled,
            'connectionStatus' => $connectionStatus,
        ]);
    }

    public function testExternalConnection(\Illuminate\Http\Request $request)
    {
        $credentials = [
            'host'     => config('rezgo.rezgo.external_sync.host'),
            'port'     => config('rezgo.rezgo.external_sync.port', 3306),
            'username' => config('rezgo.rezgo.external_sync.username'),
            'password' => config('rezgo.rezgo.external_sync.password'),
            'database' => config('rezgo.rezgo.external_sync.database_name'),
        ];
        $result = ExternalDatabaseConfigService::testConnection($credentials);
        if ($result['success']) {
            return response()->json(ExternalDatabaseConfigService::testDatabaseAccess($credentials));
        }
        return response()->json($result);
    }

    public function createExternalTables(\Illuminate\Http\Request $request)
    {
        $credentials = [
            'host'     => config('rezgo.rezgo.external_sync.host'),
            'port'     => config('rezgo.rezgo.external_sync.port', 3306),
            'username' => config('rezgo.rezgo.external_sync.username'),
            'password' => config('rezgo.rezgo.external_sync.password'),
            'database' => config('rezgo.rezgo.external_sync.database_name'),
        ];
        return response()->json(ExternalDatabaseConfigService::createTables($credentials));
    }

    public function getExternalTableStatus(\Illuminate\Http\Request $request)
    {
        $credentials = [
            'host'     => config('rezgo.rezgo.external_sync.host'),
            'port'     => config('rezgo.rezgo.external_sync.port', 3306),
            'username' => config('rezgo.rezgo.external_sync.username'),
            'password' => config('rezgo.rezgo.external_sync.password'),
            'database' => config('rezgo.rezgo.external_sync.database_name'),
        ];
        return response()->json(ExternalDatabaseConfigService::getTableStatus($credentials));
    }

    public function saveExternalSyncSettings(\Illuminate\Http\Request $request): RedirectResponse
    {
        return back()->with('info', 'External sync is managed via .env. Set DZM_COATAA_DB_* variables and REZGO_EXTERNAL_SYNC_ENABLED=true, then run: php artisan config:cache');
    }

    /**
     * Attach Rezgo images using direct CDN URLs — Railway-safe, no local disk needed.
     */
    private function attachRezgoImages(\Botble\Ecommerce\Models\Product $product, array $photoUrls): void
    {
        if (empty($photoUrls) || !$product) {
            return;
        }

        $product->image  = $photoUrls[0];
        $product->images = json_encode(array_values($photoUrls));
        $product->save();

        \Log::info('Rezgo: Images attached via direct CDN URLs', [
            'product_id'   => $product->id,
            'images_count' => count($photoUrls),
            'first_image'  => $photoUrls[0],
        ]);
    }
}
