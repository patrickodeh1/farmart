<?php

namespace Botble\RezgoConnector\Commands;

use Illuminate\Console\Command;
use Botble\RezgoConnector\Models\{RezgoProductMapping, RezgoLog};
use Botble\RezgoConnector\Services\{RezgoApiService, ExternalDatabaseSyncService};
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Facades\DB;

class SyncRezgoPrices extends Command
{
    protected $signature   = 'rezgo:sync-prices {--dry-run : Show what would change without saving}';
    protected $description = 'Fetch current prices from Rezgo and update mapped Farmart products and external DB';

    private RezgoApiService $api;
    private ExternalDatabaseSyncService $externalSync;

    public function __construct(RezgoApiService $api, ExternalDatabaseSyncService $externalSync)
    {
        parent::__construct();
        $this->api = $api;
        $this->externalSync = $externalSync;
    }

    public function handle(): int
    {
        $dryRun = $this->option('dry-run');
        
        $this->info('Starting Rezgo price sync...');
        
        if ($dryRun) {
            $this->warn('DRY RUN MODE - No changes will be saved');
        }

        try {
            // Get all product mappings
            $mappings = RezgoProductMapping::with('product')->get();
            
            if ($mappings->isEmpty()) {
                $this->warn('No product mappings found.');
                return Command::SUCCESS;
            }

            $this->info("Found " . $mappings->count() . " product mappings.");

            $updated = 0;
            $failed = 0;
            $unchanged = 0;

            foreach ($mappings as $mapping) {
                try {
                    $rezgoUid = $mapping->rezgo_uid;
                    $product = $mapping->product;

                    if (!$product) {
                        $this->warn("Mapping {$mapping->id}: Product not found");
                        $failed++;
                        continue;
                    }

                    // Fetch full item data from Rezgo
                    $response = $this->api->getItemFull($rezgoUid);

                    if (!$response['success'] || empty($response['data'])) {
                        $this->error("Mapping {$mapping->id} ({$rezgoUid}): Failed to fetch item data");
                        RezgoLog::error('sync_prices', null, "Failed to fetch item {$rezgoUid}", $response);
                        $failed++;
                        continue;
                    }

                    $itemData = $response['data'];

                    // Extract current price from Rezgo
                    $basePrice = $this->api->extractPrice($itemData);
                    $allPrices = $this->api->extractAllPrices($itemData);

                    if ($basePrice <= 0) {
                        $this->warn("Mapping {$mapping->id} ({$rezgoUid}): No valid price found");
                        $unchanged++;
                        continue;
                    }

                    // Apply mapping's margin settings to calculate sell price
                    $sellPrice = $basePrice;
                    
                    if ($mapping->margin_percent && $mapping->margin_percent > 0) {
                        $sellPrice = $basePrice + ($basePrice * $mapping->margin_percent / 100);
                    }
                    
                    if ($mapping->margin_amount && $mapping->margin_amount > 0) {
                        $sellPrice = $sellPrice + $mapping->margin_amount;
                    }

                    // Check if price changed
                    $oldPrice = $product->price;
                    $priceChanged = abs($oldPrice - $sellPrice) > 0.01;

                    if (!$priceChanged) {
                        $this->info("Mapping {$mapping->id} ({$rezgoUid}): Price unchanged at " . number_format($sellPrice, 2));
                        $unchanged++;
                        continue;
                    }

                    // Log the change
                    $logMsg = "Synced price for {$rezgoUid}: {$oldPrice} -> {$sellPrice} (base: {$basePrice}, margin%: {$mapping->margin_percent}%, margin\$: {$mapping->margin_amount})";
                    $this->info("Mapping {$mapping->id}: " . $logMsg);

                    if (!$dryRun) {
                        // Update product price
                        $product->price = $sellPrice;
                        $product->save();

                        // Update mapping's stored prices for reference
                        $mapping->update([
                            'rezgo_price' => $basePrice,
                            'sell_price' => $sellPrice,
                            'cost_price' => $basePrice,
                        ]);

                        // Sync to external database if enabled
                        $this->externalSync->syncMappingToExternal([
                            'rezgo_uid' => $rezgoUid,
                            'rezgo_title' => $product->name ?? '',
                            'rezgo_price' => $basePrice,
                        ]);

                        RezgoLog::sync('sync_prices', null, $logMsg, [
                            'product_id' => $product->id,
                            'rezgo_uid' => $rezgoUid,
                            'old_price' => $oldPrice,
                            'new_price' => $sellPrice,
                            'base_price' => $basePrice,
                            'all_prices' => $allPrices,
                        ]);
                    }

                    $updated++;

                } catch (\Exception $e) {
                    $this->error("Mapping {$mapping->id}: " . $e->getMessage());
                    RezgoLog::error('sync_prices', null, "Error syncing mapping {$mapping->id}: " . $e->getMessage());
                    $failed++;
                }
            }

            // Summary
            $this->info('');
            $this->info('=== SYNC SUMMARY ===');
            $this->info("Updated: $updated");
            $this->info("Unchanged: $unchanged");
            $this->info("Failed: $failed");
            
            if ($dryRun) {
                $this->warn('DRY RUN - No prices were actually saved');
            }

            return Command::SUCCESS;

        } catch (\Exception $e) {
            $this->error("Fatal error: " . $e->getMessage());
            RezgoLog::error('sync_prices', null, "Fatal error in sync: " . $e->getMessage());
            return Command::FAILURE;
        }
    }
}
