<?php

namespace Botble\RezgoConnector\Commands;

use Botble\RezgoConnector\Services\RezgoApiService;
use Illuminate\Console\Command;

class TestRezgoApi extends Command
{
    protected $signature = 'rezgo:test-api {uid : The Rezgo UID to test}';

    protected $description = 'Test Rezgo API extraction for images and prices';

    public function handle(): int
    {
        $uid = $this->argument('uid');
        $api = app(RezgoApiService::class);

        $this->info("Testing Rezgo API for UID: $uid\n");

        // Get full item
        $this->info('1. Fetching item from Rezgo API...');
        $response = $api->getItemFull($uid);

        if (!$response['success'] ?? false) {
            $this->error('   ❌ API request failed: ' . ($response['error'] ?? 'Unknown error'));
            return 1;
        }

        $itemData = $response['data'] ?? [];
        if (empty($itemData)) {
            $this->error('   ❌ No item data in response');
            return 1;
        }

        $this->info('   ✅ Item found');
        $this->line('   Available keys: ' . implode(', ', array_slice(array_keys($itemData), 0, 20)));

        // Test description extraction
        $this->info('\n2. Testing description extraction...');
        $description = $api->extractDescription($itemData);
        if ($description) {
            $this->line("   ✅ Description: " . substr($description, 0, 100) . '...');
        } else {
            $this->error('   ❌ No description found');
            $this->line('   Checking raw description-related fields...');
            foreach (['desc', 'description', 'details', 'overview', 'item', 'note', 'about'] as $field) {
                if (isset($itemData[$field])) {
                    $val = $itemData[$field];
                    if (is_array($val)) {
                        $this->line("   - $field: [array with " . count($val) . " items]");
                    } else {
                        $preview = substr((string)$val, 0, 50);
                        $this->line("   - $field: $preview");
                    }
                }
            }
        }

        // Test price extraction
        $this->info('\n3. Testing price extraction...');
        $price = $api->extractPrice($itemData);
        if ($price > 0) {
            $this->line("   ✅ Price: \$$price");
        } else {
            $this->error("   ⚠️  Price is 0 or empty: $price");
            $this->line('   Checking raw price fields...');
            foreach (['price', 'rate', 'starting', 'per', 'ticket_pricing', 'rate_period', 'adult_price', 'cost'] as $field) {
                if (isset($itemData[$field])) {
                    $val = $itemData[$field];
                    if (is_array($val)) {
                        $this->line("   - $field: [array] " . json_encode(array_slice($val, 0, 3)));
                    } else {
                        $this->line("   - $field: $val");
                    }
                }
            }
            if (isset($itemData['price_list'])) {
                $this->line('   - price_list: [array with ' . count($itemData['price_list']) . ' items]');
            }
            $this->error('   📌 NOTE: "starting" field has the price but extractPrice() doesn\'t check for it!');
        }

        // Test photo URL extraction
        $this->info('\n4. Testing image/photo URL extraction...');
        $photoUrls = $api->extractPhotoUrls($itemData);

        if (!empty($photoUrls)) {
            $this->line("   ✅ Found " . count($photoUrls) . " photo URLs:");
            foreach ($photoUrls as $index => $url) {
                $this->line("      [$index] " . substr($url, 0, 80) . '...');
            }
        } else {
            $this->error('   ❌ No photo URLs found');
            $this->line('   Checking raw image fields...');
            foreach (['featured_photo', 'media', 'images', 'photo', 'gallery', 'photos', 'seo'] as $field) {
                if (isset($itemData[$field])) {
                    $val = $itemData[$field];
                    if (is_array($val)) {
                        $this->line("   - $field: [array with " . count($val) . " items]");
                        if (!empty($val)) {
                            // Show structure of items
                            $count = 0;
                            foreach ($val as $idx => $item) {
                                if ($count >= 2) break;
                                if (is_array($item)) {
                                    $this->line("      [$idx] keys: " . implode(', ', array_slice(array_keys($item), 0, 8)));
                                } else {
                                    $this->line("      [$idx] " . substr((string)$item, 0, 50));
                                }
                                $count++;
                            }
                        }
                    } else {
                        $this->line("   - $field: " . substr((string)$val, 0, 50));
                    }
                }
            }
            $this->error('   📌 NOTE: media array exists but extractPhotoUrls() is not handling it correctly!');
        }

        // Test download
        $this->info('\n5. Testing image download...');
        if (!empty($photoUrls)) {
            $url = $photoUrls[0];
            $this->line("   Attempting to download: $url");
            
            try {
                $response = \Illuminate\Support\Facades\Http::timeout(15)->get($url);
                if ($response->successful()) {
                    $this->line("   ✅ Download successful (Status: {$response->status()}, Size: " . strlen($response->body()) . " bytes)");
                } else {
                    $this->error("   ❌ Download failed (Status: {$response->status()})");
                }
            } catch (\Exception $e) {
                $this->error("   ❌ Download error: " . $e->getMessage());
            }
        }

        $this->info('\n✓ Test complete');
        return 0;
    }
}
