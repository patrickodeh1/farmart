<?php

namespace Botble\RezgoConnector\Models;

use Illuminate\Database\Eloquent\Model;

class RezgoSetting extends Model
{
    protected $table = 'rezgo_settings';

    protected $fillable = ['setting_key', 'setting_value'];

    public $timestamps = true;

    /**
     * Get setting value by key
     */
    public static function getSetting(string $key, $default = null)
    {
        $setting = static::where('setting_key', $key)->first();
        return $setting ? $setting->setting_value : $default;
    }

    /**
     * Set setting value
     */
    public static function setSetting(string $key, $value): void
    {
        static::updateOrCreate(
            ['setting_key' => $key],
            ['setting_value' => $value]
        );
    }
}
