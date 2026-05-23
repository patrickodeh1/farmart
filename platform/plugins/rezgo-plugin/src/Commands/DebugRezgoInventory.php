<?php

namespace Botble\RezgoConnector\Commands;

use Illuminate\Console\Command;
use Botble\RezgoConnector\Services\RezgoSettingsService;
use Botble\RezgoConnector\Services\RezgoApiService;

class DebugRezgoInventory extends Command
{
    protected $signature = 'rezgo:debug-inventory';
    protected $description = 'Display all Rezgo inventory items to debug missing items';

    public function handle()
    {
        $this->line('═══════════════════════════════════════════════════════════════');
        $this->line('  REZGO INVENTORY DEBUG');
        $this->line('═══════════════════════════════════════════════════════════════');
        $this->newLine();

        // Initialize services
        $settingsService = app(RezgoSettingsService::class);
        $apiService = app(RezgoApiService::class);

        // Check credentials
        if (!$settingsService->isConfigured()) {
            $this->error('❌ Rezgo API not configured. Please add CID and API Key in admin settings.');
            return Command::FAILURE;
        }

        $this->info('✅ Rezgo credentials found');
        $this->newLine();

        // Fetch inventory
        $this->info('[1/3] Fetching all inventory from Rezgo API...');
        $result = $apiService->searchInventory();

        if (!$result['success']) {
            $this->error('❌ Failed to fetch inventory: ' . ($result['error'] ?? 'Unknown error'));
            return Command::FAILURE;
        }

        $inventory = $result['data']['item'] ?? [];
        if (!is_array($inventory)) {
            $inventory = [$inventory];
        }
        if (empty($inventory)) {
            $inventory = [];
        }

        $this->info('✅ Found ' . count($inventory) . ' inventory items');
        $this->newLine();

        $this->line('[2/3] Processing items...');
        $this->newLine();

        // Display inventory
        $index = 1;
        $showDebug = true;

        foreach ($inventory as $item) {
            if (!is_array($item)) {
                continue;
            }

            $uid = $item['uid'] ?? 'N/A';
            $name = $item['name'] ?? 'N/A';
            $item_title = $item['item'] ?? 'N/A';
            $option = $item['option'] ?? '';
            $description = $item['details'] ?? ($item['description'] ?? '');
            $duration = $item['duration'] ?? '';
            $price = $item['price'] ?? '';

            $this->line('Item #' . str_pad($index, 3, '0', STR_PAD_LEFT) . ':');
            $this->line('  <fg=cyan>UID:</> ' . $uid);
            $this->line('  <fg=cyan>Name:</> ' . $name);

            if ($item_title !== 'N/A' && $item_title !== $name) {
                $this->line('  <fg=cyan>Item:</> ' . $item_title);
            }

            if ($option) {
                $this->line('  <fg=cyan>Option:</> ' . substr($option, 0, 80) . (strlen($option) > 80 ? '...' : ''));
            }

            if ($duration) {
                $this->line('  <fg=cyan>Duration:</> ' . $duration);
            }

            if ($price) {
                $this->line('  <fg=cyan>Price:</> ' . $price);
            }

            if ($description) {
                $descStr = is_array($description) ? json_encode($description) : $description;
                $desc = strip_tags($descStr);
                $this->line('  <fg=cyan>Description:</> ' . substr($desc, 0, 100) . (strlen($desc) > 100 ? '...' : ''));
                $this->line('  <fg=green>Has HTML content: Yes</> (' . strlen($descStr) . ' chars)');
            } else {
                $this->line('  <fg=yellow>Description: (empty)</> ');
            }

            // Show all available fields for first item
            if ($showDebug) {
                $this->newLine();
                $this->line('  <fg=yellow>⚠️  DEBUG - All Available Fields in Response:</> ');
                foreach ($item as $fieldName => $fieldValue) {
                    if (!empty($fieldValue) && is_string($fieldValue)) {
                        $val = substr($fieldValue, 0, 50);
                        $this->line('       • <fg=cyan>' . $fieldName . ':</> ' . $val . (strlen($fieldValue) > 50 ? '...' : ''));
                    }
                }
                $showDebug = false;
            }

            $this->newLine();
            $index++;
        }

        $this->line('[3/3] Summary');
        $this->newLine();
        $this->info('Total items available in Rezgo: ' . count($inventory));
        $this->line('');
        $this->line('If you\'re missing items:');
        $this->line('  1. Search for the item UID in the list above');
        $this->line('  2. If present, try importing it via "Import as Draft" button');
        $this->line('  3. If not present, check your Rezgo account permissions');
        $this->line('');

        return Command::SUCCESS;
    }
}
