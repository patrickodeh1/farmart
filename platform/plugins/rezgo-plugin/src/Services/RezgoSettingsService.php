<?php

namespace Botble\RezgoConnector\Services;

use Botble\RezgoConnector\Models\RezgoSetting;
use Illuminate\Support\Facades\Crypt;

class RezgoSettingsService
{
    /**
     * Get all settings
     */
    public function all(): array
    {
        return RezgoSetting::pluck('setting_value', 'setting_key')->toArray();
    }

    /**
     * Get setting by key
     */
    public function get(string $key, $default = null)
    {
        $value = RezgoSetting::getSetting($key);
        
        // Decrypt sensitive keys
        if ($this->isSensitiveKey($key) && $value) {
            try {
                $decrypted = Crypt::decryptString($value);
                // Handle double-serialized values
                if (is_string($decrypted) && str_starts_with($decrypted, 's:')) {
                    return unserialize($decrypted);
                }
                return $decrypted;
            } catch (\Exception $e) {
                return $value; // Return as-is if decryption fails
            }
        }
        
        // Handle serialized values in non-sensitive keys too
        if (is_string($value) && str_starts_with($value, 's:')) {
            try {
                return unserialize($value);
            } catch (\Exception $e) {
                return $value;
            }
        }
        
        return $value ?? $default;
    }

    /**
     * Set setting by key
     */
    public function set(string $key, $value): void
    {
        // Encrypt sensitive keys
        if ($this->isSensitiveKey($key) && $value) {
            $value = Crypt::encryptString($value);
        }
        
        RezgoSetting::setSetting($key, $value);
    }

    /**
     * Get CID
     */
    public function getCid(): ?string
    {
        return $this->get('rezgo_cid');
    }

    /**
     * Set CID
     */
    public function setCid(string $cid): void
    {
        $this->set('rezgo_cid', $cid);
    }

    /**
     * Get API Key
     */
    public function getApiKey(): ?string
    {
        return $this->get('rezgo_api_key');
    }

    /**
     * Set API Key
     */
    public function setApiKey(string $key): void
    {
        $this->set('rezgo_api_key', $key);
    }

    /**
     * Check if plugin is configured
     */
    public function isConfigured(): bool
    {
        return !empty($this->getCid()) && !empty($this->getApiKey());
    }

    /**
     * List of sensitive keys that should be encrypted
     */
    private function isSensitiveKey(string $key): bool
    {
        return in_array($key, ['rezgo_api_key', 'rezgo_cid']);
    }

    /**
     * Get default passenger mapping
     */
    public function getDefaultPassengerType(): string
    {
        return $this->get('default_passenger_type', 'adult');
    }

    /**
     * Get default booking date offset (days)
     */
    public function getBookingDateOffset(): int
    {
        return (int)$this->get('booking_date_offset', 1);
    }

    /**
     * Get sync enabled status
     */
    public function isSyncEnabled(): bool
    {
        return (bool)$this->get('sync_enabled', false);
    }
}
