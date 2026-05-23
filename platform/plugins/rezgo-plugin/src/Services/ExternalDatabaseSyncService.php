<?php

namespace Botble\RezgoConnector\Services;

use Illuminate\Support\Facades\DB;
use Botble\RezgoConnector\Models\RezgoLog;

class ExternalDatabaseSyncService
{
    private ?object $externalDb = null;
    private RezgoApiService $api;

    public function __construct(RezgoApiService $api)
    {
        $this->api = $api;
        // External database connection is lazy-loaded when needed
    }

    /**
     * Get the external database connection, or create it if needed
     */
    private function getExternalDb(): ?object
    {
        // Check if external sync is enabled and configured
        if (!config('rezgo.external_sync.enabled', false)) {
            return null;
        }

        // Return cached connection if already established
        if ($this->externalDb !== null) {
            return $this->externalDb;
        }

        try {
            // Get credentials from config
            $host = config('rezgo.external_sync.host');
            $port = config('rezgo.external_sync.port', 3306);
            $username = config('rezgo.external_sync.username');
            $password = config('rezgo.external_sync.password');
            $database = config('rezgo.external_sync.database_name');

            if (!$host || !$username || !$database) {
                RezgoLog::warning(
                    'external_sync',
                    null,
                    'External database credentials not configured in .env (REZGO_EXTERNAL_*)'
                );
                return null;
            }

            // Create a PDO connection to the external database
            $dsn = "mysql:host={$host};port={$port};dbname={$database};charset=utf8mb4";
            $this->externalDb = new \PDO($dsn, $username, $password, [
                \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
            ]);

            return $this->externalDb;
        } catch (\Exception $e) {
            RezgoLog::error(
                'external_sync',
                null,
                "Failed to establish external database connection: {$e->getMessage()}"
            );
            return null;
        }
    }

    /**
     * Get gate/park price for a Rezgo tour.
     * Queries the client's external dynamic pricing database.
     *
     * Table: ticket_prices (confirmed)
     * Price column: park_price (confirmed)
     * UID column: rezgo_uid (ASSUMED — verify with client)
     *
     * @param string $rezgoUid  The Rezgo tour UID (e.g. "388968")
     * @param string|null $date Optional date YYYY-MM-DD (for date-specific pricing)
     * @return float|null       Gate price or null if not found / DB not configured
     */
    public function getGatePrice(string $rezgoUid, ?string $date = null): ?float {
        try {
            $pdo = $this->getExternalDb();
            if (!$pdo) {
                return null; // External DB not configured — gate price ceiling not applied
            }

            // TODO: Confirm UID column name with client
            // Confirmed: table = ticket_prices, price column = park_price
            // Assumed:   uid column = rezgo_uid
            $table     = 'ticket_prices';
            $uidColumn = 'rezgo_uid';  // ⚠️ ASSUMED — update when client confirms
            $priceCol  = 'park_price'; // ✅ confirmed by client

            $sql  = "SELECT {$priceCol} FROM {$table} WHERE {$uidColumn} = ?";
            $params = [$rezgoUid];

            // Add date condition if provided
            if ($date !== null) {
                $sql  .= " AND price_date = ?";
                $params[] = $date;
            }

            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $result = $stmt->fetch(\PDO::FETCH_ASSOC);

            if ($result && isset($result[$priceCol]) && $result[$priceCol] > 0) {
                return (float) $result[$priceCol];
            }

            return null;
        } catch (\Exception $e) {
            RezgoLog::error('gate_price', null, "Error fetching gate price for {$rezgoUid}: {$e->getMessage()}");
            return null;
        }
    }

    /**
     * Sync product mapping to external database
     * Called when a product is mapped to a Rezgo inventory
     */
    public function syncMappingToExternal(array $mappingData): bool
    {
        try {
            $pdo = $this->getExternalDb();
            if (!$pdo) {
                return false; // Sync disabled or not configured
            }

            $ticketName = $mappingData['rezgo_title'] ?? '';
            $rezgoUid = $mappingData['rezgo_uid'] ?? '';
            $rezgoPrice = $mappingData['rezgo_price'] ?? 0;

            if (!$ticketName || !$rezgoUid) {
                RezgoLog::error('external_sync', null, 'Missing ticket_name or rezgo_uid for sync');
                return false;
            }

            // Fetch available dates from Rezgo API
            $availableDates = $this->getAvailableDates($rezgoUid);

            // Sync to external database
            $ticketMappingTable = config('rezgo.external_sync.ticket_mapping_table', 'ticket_mapping');
            $sql = "INSERT INTO {$ticketMappingTable} (rezgo_uid, ticket_name, rezgo_price, available_dates, synced_at, updated_at)
                    VALUES (?, ?, ?, ?, NOW(), NOW())
                    ON DUPLICATE KEY UPDATE
                    ticket_name = ?, rezgo_price = ?, available_dates = ?, synced_at = NOW(), updated_at = NOW()";

            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                $rezgoUid,
                $ticketName,
                $rezgoPrice,
                json_encode($availableDates),
                $ticketName,
                $rezgoPrice,
                json_encode($availableDates),
            ]);

            RezgoLog::sync(
                'external_sync',
                null,
                "Synced ticket mapping to external database: {$ticketName}",
                ['rezgo_uid' => $rezgoUid, 'price' => $rezgoPrice, 'dates_count' => count($availableDates)]
            );

            return true;
        } catch (\Exception $e) {
            RezgoLog::error(
                'external_sync',
                null,
                "Failed to sync to external database: {$e->getMessage()}",
                ['trace' => $e->getTraceAsString()]
            );
            return false;
        }
    }

    /**
     * Get available dates from Rezgo API for a specific inventory UID
     */
    private function getAvailableDates(string $rezgoUid): array
    {
        try {
            // For now, return empty array since we don't have a direct API method
            // Available dates can be fetched from the inventory search results when needed
            return [];
        } catch (\Exception $e) {
            RezgoLog::warning(
                'external_sync',
                null,
                "Could not fetch dates for UID {$rezgoUid}: {$e->getMessage()}"
            );
            return [];
        }
    }

    /**
     * Delete mapping from external database when unmapped
     */
    public function deleteMappingFromExternal(string $rezgoUid): bool
    {
        try {
            $pdo = $this->getExternalDb();
            if (!$pdo) {
                return false;
            }

            $ticketMappingTable = config('rezgo.external_sync.ticket_mapping_table', 'ticket_mapping');
            $sql = "DELETE FROM {$ticketMappingTable} WHERE rezgo_uid = ?";

            $stmt = $pdo->prepare($sql);
            $stmt->execute([$rezgoUid]);

            RezgoLog::sync('external_sync', null, "Deleted ticket mapping from external DB: {$rezgoUid}");
            return true;
        } catch (\Exception $e) {
            RezgoLog::error('external_sync', null, "Error deleting from external DB: {$e->getMessage()}");
            return false;
        }
    }
}
