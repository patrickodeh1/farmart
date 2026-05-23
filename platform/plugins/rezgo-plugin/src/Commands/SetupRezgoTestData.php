<?php

namespace Botble\RezgoConnector\Commands;

use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Order;
use Botble\Ecommerce\Models\OrderProduct;
use Botble\Ecommerce\Models\Product;
use Botble\RezgoConnector\Models\RezgoProductMapping;
use Botble\RezgoConnector\Models\RezgoSubmission;
use Botble\RezgoConnector\Services\RezgoApiService;
use Illuminate\Console\Command;
use Illuminate\Support\Str;

class SetupRezgoTestData extends Command
{
    protected $signature = 'rezgo:setup-test-data {--update-existing : Update existing John Doe submission}';
    protected $description = 'Set up test data for Rezgo integration testing';

    protected RezgoApiService $api;

    public function __construct(RezgoApiService $api)
    {
        parent::__construct();
        $this->api = $api;
    }

    public function handle()
    {
        $this->info("\n=== REZGO TEST DATA SETUP ===\n");

        // Step 1: Update existing submission if requested
        if ($this->option('update-existing')) {
            $this->info('Step 1: Updating existing submission to Dreamzone Test...');
            $this->updateExistingSubmission();
            $this->line('');
        }

        // Step 2: Fetch Rezgo tours
        $this->info('Step 2: Fetching available Rezgo tours...');
        $selectedTours = $this->fetchAndSelectTours();

        if (empty($selectedTours)) {
            $this->error('No tours available from Rezgo API');
            return Command::FAILURE;
        }

        $this->line('');

        // Step 3: Create products
        $this->info('Step 3: Creating Farmart products...');
        $products = $this->createProducts($selectedTours);
        $this->line('');

        // Step 4: Create test customer
        $this->info('Step 4: Setting up test customer...');
        $customer = $this->createTestCustomer();
        $this->line('');

        // Step 5: Create test orders
        $this->info('Step 5: Creating test orders...');
        $this->createTestOrders($products, $customer);
        $this->line('');

        $this->info('=== SETUP COMPLETE ===');
        $this->line("\n✓ Updated existing submission to 'Dreamzone Test'");
        $this->line("✓ Created " . count($products) . " products in Farmart");
        $this->line("✓ Created " . count($products) . " test orders");
        $this->line("\nNext steps:");
        $this->line("1. Verify orders appear in /admin/rezgo/submissions");
        $this->line("2. Check that order events trigger Rezgo submissions");
        $this->line("3. Verify 'Dreamzone Test' bookings in Rezgo backend\n");

        return Command::SUCCESS;
    }

    private function updateExistingSubmission(): void
    {
        $submission = RezgoSubmission::where('status', 'success')->first();
        if (!$submission) {
            $this->line("  ✗ No existing successful submission found");
            return;
        }

        $request = json_decode($submission->request_payload, true) ?? [];
        $request['tour_first_name'] = 'Dreamzone';
        $request['tour_last_name'] = 'Test';
        $request['customer_email'] = 'test@dreamzone.com';
        $submission->request_payload = json_encode($request);
        $submission->save();

        $this->line("  ✓ Updated submission #{$submission->id}");
    }

    private function fetchAndSelectTours(): array
    {
        $response = $this->api->searchInventory([]);

        if (!isset($response['data']['item'])) {
            $this->warn('  No tours returned from API');
            return [];
        }

        $items = $response['data']['item'];
        $items = is_array($items) && isset($items[0]) ? $items : [$items];

        $this->line("  Found " . count($items) . " total tours");

        // Separate by type
        $universal = [];
        $disney = [];
        $other = [];

        foreach ($items as $tour) {
            $name = strtolower($tour['name'] ?? $tour['item'] ?? $tour['tour_name'] ?? '');
            if (strpos($name, 'universal') !== false) {
                $universal[] = $tour;
            } elseif (strpos($name, 'disney') !== false) {
                $disney[] = $tour;
            } else {
                $other[] = $tour;
            }
        }

        // Select 5 Universal, 5 Disney
        $selected = array_merge(
            array_slice($universal, 0, 5),
            array_slice($disney, 0, 5)
        );

        // Fill remaining slots
        if (count($selected) < 10) {
            $remaining = 10 - count($selected);
            $selected = array_merge($selected, array_slice($other, 0, $remaining));
        }

        $selected = array_slice($selected, 0, 10);

        $this->line("  Selected " . count($selected) . " for testing:");
        foreach ($selected as $idx => $tour) {
            $this->line("    " . ($idx + 1) . ". " . ($tour['name'] ?? $tour['item'] ?? $tour['uid'] ?? 'Unknown'));
        }

        return $selected;
    }

    private function createProducts(array $tours): array
    {
        $products = [];

        foreach ($tours as $tour) {
            $tourName = $tour['name'] ?? $tour['item'] ?? $tour['tour_name'] ?? 'Tour';
            $product = Product::firstOrCreate(
                ['name' => $tourName],
                [
                    'description' => 'Rezgo Tour: ' . $tourName,
                    'status' => 'published',
                    'price' => (float)($tour['rate_period'] ?? 299.99),
                    'quantity' => 100,
                ]
            );

            // Create or update mapping
            RezgoProductMapping::updateOrCreate(
                ['product_id' => $product->id],
                [
                    'rezgo_uid' => $tour['uid'],
                    'rezgo_title' => $tourName,
                    'passenger_type' => 'adult',
                    'is_active' => true,
                ]
            );

            $this->line("  ✓ " . $tourName . " (ID: {$product->id})");

            $products[] = [
                'product' => $product,
                'tour' => $tour,
            ];
        }

        return $products;
    }

    private function createTestCustomer(): Customer
    {
        $customer = Customer::firstOrCreate(
            ['email' => 'test@dreamzone.com'],
            [
                'first_name' => 'Dreamzone',
                'last_name' => 'Test',
                'phone' => '555-0123',
                'password' => bcrypt('password123'),
                'is_active' => true,
            ]
        );

        $this->line("  ✓ Test customer: {$customer->first_name} {$customer->last_name}");

        return $customer;
    }

    private function createTestOrders(array $products, Customer $customer): void
    {
        $now = now();

        foreach ($products as $idx => $data) {
            $order = new Order();
            $order->user_id = $customer->id;
            $order->code = 'REZTEST' . date('YmdHis') . str_pad($idx, 2, '0', STR_PAD_LEFT);
            $order->description = 'Rezgo Test Order';
            $order->status = 'pending';
            $order->payment_status = 'pending';
            $order->total = 299.99;
            $order->save();

            // Create order product
            $orderProduct = new OrderProduct();
            $orderProduct->order_id = $order->id;
            $orderProduct->product_id = $data['product']->id;
            $orderProduct->product_name = $data['product']->name;
            $orderProduct->qty = 1;
            $orderProduct->price = 299.99;
            $orderProduct->save();

            $this->line("  ✓ Order #{$order->id} - {$data['product']->name}");
        }

        $this->line("  Created " . count($products) . " test orders");
    }
}
