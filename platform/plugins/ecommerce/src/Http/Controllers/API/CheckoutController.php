<?php

namespace Botble\Ecommerce\Http\Controllers\API;

use Botble\Ecommerce\Facades\Cart;
use Botble\Ecommerce\Facades\OrderHelper;
use Botble\Ecommerce\Http\Controllers\BaseController;
use Botble\Ecommerce\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckoutController extends BaseController
{
    public function process(string $id, Request $request)
    {
        Cart::instance('cart')->restore($id);

        $token = OrderHelper::getOrderSessionToken();

        $user = $request->user();

        if ($user instanceof Customer) {
            Auth::guard('customer')->login($user);
        }

        Cart::instance('cart')->store($id);

        return redirect()->to(route('public.checkout.information', $token));
    }
}
