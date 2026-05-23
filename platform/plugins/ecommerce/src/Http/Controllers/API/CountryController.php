<?php

namespace Botble\Ecommerce\Http\Controllers\API;

use Botble\Base\Http\Controllers\BaseController;
use Botble\Ecommerce\Facades\EcommerceHelper;

class CountryController extends BaseController
{
    /**
     * Get list of available countries
     *
     * @group Address
     *
     * @response {
     *   "error": false,
     *   "data": [
     *     {
     *       "name": "Vietnam",
     *       "code": "VN"
     *     }
     *   ],
     *   "message": null
     * }
     */
    public function index()
    {
        $countries = collect(EcommerceHelper::getAvailableCountries())
            ->filter(fn ($name, $code) => $code !== '')
            ->map(function ($name, $code) {
                return [
                    'name' => $name,
                    'code' => $code,
                ];
            })
            ->values();

        return $this->httpResponse()
            ->setData($countries);
    }
}
