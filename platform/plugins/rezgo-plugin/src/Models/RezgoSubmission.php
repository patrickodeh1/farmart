<?php

namespace Botble\RezgoConnector\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RezgoSubmission extends Model
{
    protected $table = 'rezgo_submissions';

    protected $fillable = [
        'order_id',
        'rezgo_booking_id',
        'status',
        'request_payload',
        'response_payload',
        'http_status',
        'error_message',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'http_status' => 'integer',
    ];

    public $timestamps = true;

    /**
     * Relationship to order
     */
    public function order(): BelongsTo
    {
        return $this->belongsTo(
            \Botble\Ecommerce\Models\Order::class,
            'order_id',
            'id'
        );
    }

    /**
     * Check if submission was successful.
     * FIX: was checking http_status === 200 but controller saves 201 on success.
     * The status string column is authoritative.
     */
    public function isSuccessful(): bool
    {
        return $this->status === 'success';
    }

    /**
     * Get request data as array
     */
    public function getRequestData(): array
    {
        return json_decode($this->request_payload, true) ?? [];
    }

    /**
     * Get response data as array
     */
    public function getResponseData(): array
    {
        return json_decode($this->response_payload, true) ?? [];
    }
}
