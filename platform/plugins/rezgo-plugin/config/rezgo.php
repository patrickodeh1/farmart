<?php

return [
    /**
     * Rezgo API Configuration
     */
    'api' => [
        'endpoint' => env('REZGO_API_ENDPOINT', 'https://api.rezgo.com/index_json.php'),
        'timeout' => env('REZGO_API_TIMEOUT', 30),
    ],

    /**
     * Default booking settings
     */
    'booking' => [
        'default_passenger_type' => env('REZGO_PASSENGER_TYPE', 'Adult'),
        'default_date_offset' => env('REZGO_BOOKING_OFFSET', 0),
    ],

    /**
     * Logging configuration
     */
    'logging' => [
        'enabled' => env('REZGO_LOGGING_ENABLED', true),
        'channel' => 'rezgo', // Requires channel in config/logging.php
        'database' => env('REZGO_DB_LOGGING', true),
    ],

    /**
     * Sync settings
     */
    'sync' => [
        'enabled' => env('REZGO_SYNC_ENABLED', false),
        'auto_submit_orders' => env('REZGO_AUTO_SUBMIT', true),
    ],

    /**
     * External Database Sync (to custom PHP app)
     */
    'external_sync' => [
        'enabled' => env('REZGO_EXTERNAL_SYNC_ENABLED', false),
        'database' => env('REZGO_EXTERNAL_DB', 'external'),
        'host' => env('DZM_COATAA_DB_HOST', env('DB_HOST')),
        'port' => env('DZM_COATAA_DB_PORT', env('DB_PORT')),
        'username' => env('DZM_COATAA_DB_USERNAME', env('DB_USERNAME')),
        'password' => env('DZM_COATAA_DB_PASSWORD', env('DB_PASSWORD')),
        'database_name' => env('DZM_COATAA_DB_DATABASE', 'your_custom_db'),
        'ticket_mapping_table' => env('REZGO_TICKET_MAPPING_TABLE', 'ticket_mapping'),
        'ticket_pricing_table' => env('REZGO_TICKET_PRICING_TABLE', 'ticket_pricing'),
        'dates_availability_table' => env('REZGO_DATES_AVAILABILITY_TABLE', 'dates_availability'),
    ],
];
