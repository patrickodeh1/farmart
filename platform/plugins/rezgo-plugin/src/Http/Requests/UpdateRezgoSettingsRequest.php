<?php

namespace Botble\RezgoConnector\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRezgoSettingsRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'rezgo_cid' => 'required|string|max:50',
            'rezgo_api_key' => 'required|string|max:255',
            'default_passenger_type' => 'required|in:adult,child,senior',
            'booking_date_offset' => 'required|integer|min:0|max:365',
            'sync_enabled' => 'boolean',
        ];
    }

    public function authorize(): bool
    {
        return true;
    }
}
