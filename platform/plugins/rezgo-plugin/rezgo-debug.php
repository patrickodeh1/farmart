<?php
/**
 * Rezgo Connector - Standalone Debug Script
 * 
 * This script can be run independently to debug Rezgo API connectivity.
 * Works without Laravel Artisan or command registration.
 * 
 * Usage:
 *   From command line: php rezgo-debug.php
 *   From web browser: Copy to public folder and access via URL
 */

// Detect if running from CLI
$isCLI = (php_sapi_name() === 'cli');

// Auto-detect Laravel root directory
// Current script: /main/platform/plugins/rezgo-plugin/rezgo-debug.php
// We need: /main
$currentDir = __DIR__;
$laravelRoot = null;

// Try different paths to find the Laravel root
$paths = [
    dirname(dirname(dirname($currentDir))), // /main
    dirname(dirname(dirname(dirname($currentDir)))), // /farmart
];

foreach ($paths as $path) {
    if (file_exists($path . '/vendor/autoload.php')) {
        $laravelRoot = $path;
        break;
    }
}

if (!$laravelRoot) {
    die("Error: Cannot find Laravel root directory with vendor/autoload.php\n");
}

// Load composer autoloader
$autoloadPath = $laravelRoot . '/vendor/autoload.php';
require $autoloadPath;

// Load environment
$app = require $laravelRoot . '/bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

// Now we have access to Laravel services
try {
    if ($isCLI) {
        echo "═══════════════════════════════════════════════════════════════\n";
        echo "  REZGO INVENTORY DEBUG\n";
        echo "═══════════════════════════════════════════════════════════════\n";
        echo "\n";
    }

    // Get the API service
    $apiService = app('Botble\RezgoConnector\Services\RezgoApiService');

    // Check if configured using method call instead of property
    $isConfigured = false;
    try {
        // Try to call a method that tests configuration
        $testResponse = $apiService->getCompanyInfo();
        $isConfigured = ($testResponse['success'] ?? false);
    } catch (\Exception $e) {
        $isConfigured = false;
    }

    if (!$isConfigured) {
        if ($isCLI) {
            echo "✗ Rezgo credentials not found or not configured\n";
            echo "Please configure your Rezgo API credentials in the admin panel.\n";
        } else {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'error' => 'Rezgo credentials not found']);
        }
        exit(1);
    }

    if ($isCLI) {
        echo "✅ Rezgo credentials found\n\n";
        echo "[1/3] Fetching all inventory from Rezgo API...\n";
    }

    // Fetch inventory
    $result = $apiService->searchInventory();

    if (!$result['success']) {
        if ($isCLI) {
            echo "✗ Failed to fetch inventory\n";
            echo "Error: " . ($result['error'] ?? 'Unknown error') . "\n";
        } else {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'error' => $result['error'] ?? 'Unknown error']);
        }
        exit(1);
    }

    if (!isset($result['data']['item'])) {
        if ($isCLI) {
            echo "✗ No items found in API response\n";
        } else {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'error' => 'No items in API response']);
        }
        exit(1);
    }

    $items = $result['data']['item'];
    if (!is_array($items) || !isset($items[0])) {
        $items = [$items];
    }

    if ($isCLI) {
        echo "✅ Found " . count($items) . " inventory items\n\n";
        echo "[2/3] Processing items...\n\n";
    }

    $itemsArray = [];
    $index = 1;
    $showDebug = true;

    foreach ($items as $item) {
        $uid = $item['uid'] ?? 'N/A';
        $name = $item['name'] ?? 'N/A';
        $itemName = $item['item'] ?? 'N/A';
        $option = $item['option'] ?? '';
        $duration = $item['duration'] ?? '';
        $price = $item['starting'] ?? '';
        $description = $item['description'] ?? $item['details'] ?? $item['notes'] ?? $item['overview'] ?? $item['highlights'] ?? $item['inclusions'] ?? '';

        $itemData = [
            'num' => $index,
            'uid' => $uid,
            'name' => $name,
            'item' => $itemName,
            'option' => $option,
            'duration' => $duration,
            'price' => $price,
            'description_length' => is_string($description) ? strlen($description) : (is_array($description) ? strlen(json_encode($description)) : 0),
        ];

        $itemsArray[] = $itemData;

        if ($isCLI) {
            echo "Item #" . str_pad($index, 3, '0', STR_PAD_LEFT) . ":\n";
            echo "  UID:       $uid\n";
            echo "  Name:      $name\n";
            echo "  Item:      $itemName\n";

            if ($option) {
                echo "  Option:    $option\n";
            }

            if ($duration) {
                echo "  Duration:  $duration\n";
            }

            if ($price) {
                echo "  Price:     $price\n";
            }

            if ($description) {
                $descStr = is_array($description) ? json_encode($description) : $description;
                $desc = strip_tags($descStr);
                echo "  Desc:      " . substr($desc, 0, 80) . (strlen($desc) > 80 ? "...\n" : "\n");
                echo "  HTML:      Yes (" . strlen($descStr) . " chars)\n";
            } else {
                echo "  Desc:      (empty)\n";
            }

            // Show all fields for first item
            if ($showDebug) {
                echo "\n  Available Fields:\n";
                foreach ($item as $fieldName => $fieldValue) {
                    if (!empty($fieldValue) && is_string($fieldValue) && strlen($fieldValue) < 100) {
                        echo "       • $fieldName: " . substr($fieldValue, 0, 60) . "\n";
                    }
                }
                $showDebug = false;
            }

            echo "\n";
        }

        $index++;
    }

    if ($isCLI) {
        echo "[3/3] Summary\n";
        echo "\n";
        echo "Total items available in Rezgo: " . count($items) . "\n";
        echo "\n";
        echo "═══════════════════════════════════════════════════════════════\n";
        echo "If you're missing items:\n";
        echo "  1. Search for the item UID in the list above\n";
        echo "  2. If present, try importing via 'Import as Draft' button\n";
        echo "  3. If not present, check your Rezgo account permissions\n";
        echo "\n";
    } else {
        header('Content-Type: application/json');
        echo json_encode([
            'success' => true,
            'count' => count($items),
            'items' => $itemsArray,
        ], JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    }

} catch (Exception $e) {
    if ($isCLI) {
        echo "✗ Error: " . $e->getMessage() . "\n";
    } else {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    }
    exit(1);
}
?>
