<?php

use Botble\Mollie\Http\Controllers\MollieController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['core']], function (): void {
    Route::post('mollie/payment/callback/{token}', [MollieController::class, 'paymentCallback'])
        ->name('mollie.payment.callback');
});
