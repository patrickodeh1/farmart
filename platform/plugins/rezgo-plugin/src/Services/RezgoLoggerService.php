<?php

namespace Botble\RezgoConnector\Services;

use Illuminate\Support\Facades\Log;
use Botble\RezgoConnector\Models\RezgoLog;

class RezgoLoggerService
{
    private string $logChannel = 'rezgo';
    private string $logFile = 'rezgo-sync.log';

    /**
     * Initialize logging channel if needed
     */
    public function __construct()
    {
        // Configure logging if not already configured
        if (!config('logging.channels.' . $this->logChannel)) {
            config([
                'logging.channels.' . $this->logChannel => [
                    'driver' => 'single',
                    'path' => storage_path('logs/' . $this->logFile),
                    'level' => env('LOG_LEVEL', 'debug'),
                ],
            ]);
        }
    }

    /**
     * Log sync information
     */
    public function sync(string $message, array $context = []): void
    {
        Log::channel($this->logChannel)->info('[SYNC] ' . $message, $context);
        RezgoLog::sync('unknown', null, $message, $context);
    }

    /**
     * Log error
     */
    public function error(string $message, array $context = []): void
    {
        Log::channel($this->logChannel)->error('[ERROR] ' . $message, $context);
        RezgoLog::error('unknown', null, $message, $context);
    }

    /**
     * Log warning
     */
    public function warning(string $message, array $context = []): void
    {
        Log::channel($this->logChannel)->warning('[WARNING] ' . $message, $context);
        RezgoLog::warning('unknown', null, $message, $context);
    }

    /**
     * Log info
     */
    public function info(string $message, array $context = []): void
    {
        Log::channel($this->logChannel)->info('[INFO] ' . $message, $context);
        RezgoLog::info('unknown', null, $message, $context);
    }

    /**
     * Get recent logs
     */
    public function getRecentLogs(int $limit = 50): array
    {
        return RezgoLog::latest()
            ->limit($limit)
            ->get()
            ->toArray();
    }

    /**
     * Get logs by type
     */
    public function getLogsByType(string $type, int $limit = 50): array
    {
        return RezgoLog::where('log_type', $type)
            ->latest()
            ->limit($limit)
            ->get()
            ->toArray();
    }
}
