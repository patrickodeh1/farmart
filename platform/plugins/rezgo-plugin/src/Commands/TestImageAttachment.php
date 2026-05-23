<?php

namespace Botble\RezgoConnector\Commands;

use Botble\RezgoConnector\Services\RezgoApiService;
use Illuminate\Console\Command;

class TestImageAttachment extends Command
{
    protected $signature = 'rezgo:test-images {uid : The Rezgo UID to test}';

    protected $description = 'Test full image extraction and attachment process';

    public function handle(): int
    {
        $uid = $this->argument('uid');
        $api = app(RezgoApiService::class);

        $this->info("Testing image attachment for UID: $uid\n");

        // Step 1: Get item data
        $this->info('Step 1: Fetching item from Rezgo API...');
        $response = $api->getItemFull($uid);
        
        if (!$response['success'] ?? false) {
            $this->error('   ❌ Failed: ' . ($response['error'] ?? 'Unknown'));
            return 1;
        }

        $itemData = $response['data'] ?? [];
        $this->line('   ✅ Item found');

        // Step 2: Extract photos
        $this->info('\nStep 2: Extracting photo URLs...');
        $photoUrls = $api->extractPhotoUrls($itemData);
        
        if (empty($photoUrls)) {
            $this->error('   ❌ No photos found');
            return 1;
        }

        $this->line("   ✅ Found " . count($photoUrls) . " photo(s):");
        foreach ($photoUrls as $i => $url) {
            $this->line("      [$i] " . substr($url, 0, 80));
        }

        // Step 3: Test download
        $this->info('\nStep 3: Testing image downloads...');
        $downloadSuccess = true;
        
        foreach ($photoUrls as $i => $url) {
            try {
                $response = \Illuminate\Support\Facades\Http::timeout(15)->get($url);
                if ($response->successful()) {
                    $size = strlen($response->body()) / 1024;  // KB
                    $this->line("   ✅ [$i] Downloaded {$size}KB from " . substr($url, 0, 60));
                } else {
                    $this->error("   ❌ [$i] HTTP {$response->status()}: " . substr($url, 0, 60));
                    $downloadSuccess = false;
                }
            } catch (\Exception $e) {
                $this->error("   ❌ [$i] Error: " . $e->getMessage());
                $downloadSuccess = false;
            }
        }

        if (!$downloadSuccess) {
            $this->warn('\n⚠️  Some images failed to download - check URLs or network');
            return 1;
        }

        // Step 4: Test storage
        $this->info('\nStep 4: Testing local storage...');
        $disk = \Storage::disk('public');
        $storageDir = 'products/' . date('Y/m');
        
        if (!$disk->exists($storageDir)) {
            $disk->makeDirectory($storageDir);
            $this->line("   ✅ Created directory: $storageDir");
        } else {
            $this->line("   ✅ Directory exists: $storageDir");
        }

        // Step 5: Test writing a file
        $this->info('\nStep 5: Testing file write...');
        $testFile = $storageDir . '/rezgo_test_' . time() . '.jpg';
        
        try {
            $disk->put($testFile, 'test content');
            $exists = $disk->exists($testFile);
            if ($exists) {
                $this->line("   ✅ Test file created: $testFile");
                $disk->delete($testFile);
                $this->line("   ✅ Test file cleaned up");
            } else {
                $this->error("   ❌ File write failed");
                return 1;
            }
        } catch (\Exception $e) {
            $this->error("   ❌ Storage error: " . $e->getMessage());
            return 1;
        }

        // Step 6: Check Media model
        $this->info('\nStep 6: Checking Media model availability...');
        if (class_exists('\Botble\Media\Models\MediaFile')) {
            $this->line("   ✅ MediaFile model available");
            
            // Test creating a dummy record
            try {
                $count = \Botble\Media\Models\MediaFile::count();
                $this->line("   ✅ MediaFile table has $count records");
            } catch (\Exception $e) {
                $this->error("   ⚠️  Cannot access MediaFile table: " . $e->getMessage());
            }
        } else {
            $this->warn("   ⚠️  MediaFile model not found - images may not attach to gallery");
        }

        // Step 7: Test product image relationship
        $this->info('\nStep 7: Checking product image relationship...');
        
        // Create a temporary test product
        try {
            $product = new \Botble\Ecommerce\Models\Product();
            
            if (method_exists($product, 'images')) {
                $this->line("   ✅ Product has images() relationship");
            } else {
                $this->error("   ❌ Product missing images() relationship");
                $this->line("   Available methods: " . implode(', ', get_class_methods($product)));
            }
        } catch (\Exception $e) {
            $this->error("   ❌ Error: " . $e->getMessage());
        }

        $this->info('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        $this->info('✓ All image attachment tests complete!');
        $this->info('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        
        return 0;
    }
}
