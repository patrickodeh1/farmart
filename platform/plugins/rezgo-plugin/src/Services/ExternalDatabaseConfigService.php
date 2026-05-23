<?php

namespace Botble\RezgoConnector\Services;

use Illuminate\Support\Facades\DB;
use PDO;
use Exception;

class ExternalDatabaseConfigService
{
    /**
     * Test connection to external database
     */
    public static function testConnection(array $credentials): array
    {
        try {
            $pdo = new PDO(
                "mysql:host={$credentials['host']};port={$credentials['port']}",
                $credentials['username'],
                $credentials['password'],
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
            );

            return [
                'success' => true,
                'message' => 'Successfully connected to MySQL server',
            ];
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'Connection failed: ' . $e->getMessage(),
            ];
        }
    }

    /**
     * Test access to external database
     */
    public static function testDatabaseAccess(array $credentials): array
    {
        try {
            $pdo = new PDO(
                "mysql:host={$credentials['host']};port={$credentials['port']};dbname={$credentials['database']}",
                $credentials['username'],
                $credentials['password'],
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
            );

            // Try a simple query to verify access
            $pdo->query('SELECT 1');

            return [
                'success' => true,
                'message' => 'Successfully accessed database: ' . $credentials['database'],
            ];
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'Database access failed: ' . $e->getMessage(),
            ];
        }
    }

    /**
     * Create required tables in external database
     */
    public static function createTables(array $credentials): array
    {
        try {
            $pdo = new PDO(
                "mysql:host={$credentials['host']};port={$credentials['port']};dbname={$credentials['database']}",
                $credentials['username'],
                $credentials['password'],
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
            );

            // Create ticket_mapping table
            $pdo->exec("
                CREATE TABLE IF NOT EXISTS ticket_mapping (
                    rezgo_uid VARCHAR(255) PRIMARY KEY,
                    ticket_name VARCHAR(255) NOT NULL,
                    rezgo_price DECIMAL(10, 2) DEFAULT 0,
                    available_dates JSON,
                    synced_at TIMESTAMP NULL,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    INDEX idx_synced (synced_at)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
            ");

            // Create ticket_pricing table
            $pdo->exec("
                CREATE TABLE IF NOT EXISTS ticket_pricing (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    rezgo_uid VARCHAR(255) NOT NULL,
                    price_date DATE NOT NULL,
                    current_price DECIMAL(10, 2),
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    UNIQUE KEY unique_uid_date (rezgo_uid, price_date),
                    FOREIGN KEY (rezgo_uid) REFERENCES ticket_mapping(rezgo_uid) ON DELETE CASCADE,
                    INDEX idx_date (price_date)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
            ");

            // Create dates_availability table
            $pdo->exec("
                CREATE TABLE IF NOT EXISTS dates_availability (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    rezgo_uid VARCHAR(255) NOT NULL,
                    available_date DATE NOT NULL,
                    spots_available INT,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    UNIQUE KEY unique_uid_date (rezgo_uid, available_date),
                    FOREIGN KEY (rezgo_uid) REFERENCES ticket_mapping(rezgo_uid) ON DELETE CASCADE,
                    INDEX idx_date (available_date)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
            ");

            return [
                'success' => true,
                'message' => 'All required tables created successfully in external database',
            ];
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'Failed to create tables: ' . $e->getMessage(),
            ];
        }
    }

    /**
     * Get table status from external database
     */
    public static function getTableStatus(array $credentials): array
    {
        try {
            $pdo = new PDO(
                "mysql:host={$credentials['host']};port={$credentials['port']};dbname={$credentials['database']}",
                $credentials['username'],
                $credentials['password'],
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
            );

            $tables = ['ticket_mapping', 'ticket_pricing', 'dates_availability'];
            $status = [];

            foreach ($tables as $table) {
                try {
                    $result = $pdo->query("SELECT COUNT(*) as count FROM {$table}")->fetch(PDO::FETCH_ASSOC);
                    $status[$table] = [
                        'exists' => true,
                        'records' => $result['count'] ?? 0,
                    ];
                } catch (Exception $e) {
                    $status[$table] = [
                        'exists' => false,
                        'records' => 0,
                    ];
                }
            }

            return [
                'success' => true,
                'tables' => $status,
            ];
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'Failed to get table status: ' . $e->getMessage(),
            ];
        }
    }
}
