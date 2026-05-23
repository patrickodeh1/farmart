<?php

use Botble\Ecommerce\Http\Controllers\API\AddressController;
use Botble\Ecommerce\Http\Controllers\API\BrandController;
use Botble\Ecommerce\Http\Controllers\API\CartController;
use Botble\Ecommerce\Http\Controllers\API\CheckoutController;
use Botble\Ecommerce\Http\Controllers\API\CountryController;
use Botble\Ecommerce\Http\Controllers\API\OrderController;
use Botble\Ecommerce\Http\Controllers\API\ProductCategoryController;
use Botble\Ecommerce\Http\Controllers\API\ProductController;
use Botble\Ecommerce\Http\Controllers\API\TaxController;
use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
    'prefix' => 'api/v1/ecommerce/',
    'namespace' => 'Botble\Ecommerce\Http\Controllers\API',
], function (): void {
    Route::get('products', [ProductController::class, 'index']);
    Route::get('products/{slug}', [ProductController::class, 'show']);
    Route::get('products/{slug}/related', [ProductController::class, 'relatedProducts']);
    Route::get('products/{slug}/reviews', [ProductController::class, 'reviews']);

    Route::get('product-categories', [ProductCategoryController::class, 'index']);
    Route::get('product-categories/{slug}', [ProductCategoryController::class, 'show']);
    Route::get('product-categories/{id}/products', [ProductCategoryController::class, 'products']);

    Route::get('brands', [BrandController::class, 'index']);
    Route::get('brands/{slug}', [BrandController::class, 'show']);
    Route::get('brands/{id}/products', [BrandController::class, 'products']);

    Route::group(['middleware' => ['auth:sanctum']], function (): void {
        Route::get('orders', [OrderController::class, 'index']);
        Route::get('orders/{id}', [OrderController::class, 'show']);
        Route::get('addresses', [AddressController::class, 'index']);
        Route::post('addresses', [AddressController::class, 'store']);
        Route::put('addresses/{id}', [AddressController::class, 'update']);
        Route::delete('addresses/{id}', [AddressController::class, 'destroy']);
    });

    Route::post('cart', [CartController::class, 'store']);
    Route::put('cart/{id}', [CartController::class, 'update']);
    Route::delete('cart/{id}', [CartController::class, 'destroy']);
    Route::get('cart/{id}', [CartController::class, 'index']);

    Route::post('cart/refresh', [CartController::class, 'refresh']);
    Route::get('countries', [CountryController::class, 'index']);

    Route::post('checkout/taxes/calculate', TaxController::class);

    Route::group(['middleware' => ['web', 'core']], function (): void {
        Route::get('checkout/cart/{id}', [CheckoutController::class, 'process']);
    });
});
