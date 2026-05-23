<?php

namespace Botble\RezgoConnector\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RezgoProductMapping extends Model
{
    protected $table = 'rezgo_product_mappings';

    protected $fillable = [
        'product_id',
        'rezgo_uid',
        'rezgo_title',
        'rezgo_price',
        'cost_price',
        'sell_price',
        'margin_amount',
        'margin_percent',
        'markup_type',
        'markup_value',
        'passenger_type',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'rezgo_price' => 'decimal:2',
        'cost_price' => 'decimal:2',
        'sell_price' => 'decimal:2',
        'margin_amount' => 'decimal:2',
        'margin_percent' => 'decimal:2',
        'markup_type' => 'string',
        'markup_value' => 'decimal:2',
    ];

    public $timestamps = true;

    /**
     * Relationship to product
     */
    public function product(): BelongsTo
    {
        return $this->belongsTo(
            \Botble\Ecommerce\Models\Product::class,
            'product_id',
            'id'
        );
    }

    /**
     * Get mapping by product ID
     */
    public static function getByProductId(int $productId): ?self
    {
        return static::where('product_id', $productId)
            ->where('is_active', true)
            ->first();
    }

    /**
     * Get mapping by Rezgo UID
     */
    public static function getByRezgoUid(string $uid): ?self
    {
        return static::where('rezgo_uid', $uid)
            ->where('is_active', true)
            ->first();
    }
}
