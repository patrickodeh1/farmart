<?php

namespace Botble\Ecommerce\Http\Controllers\API;

use Botble\Base\Http\Controllers\BaseController;
use Botble\Ecommerce\Http\Resources\API\OrderDetailResource;
use Botble\Ecommerce\Http\Resources\API\OrderResource;
use Botble\Ecommerce\Models\Order;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class OrderController extends BaseController
{
    /**
     * Get list of orders by customer
     *
     * @group Orders
     *
     * @return JsonResponse
     *
     * @authenticated
     */
    public function index(Request $request)
    {
        $orders = Order::query()
            ->where([
                'user_id' => $request->user()->id,
                'is_finished' => 1,
            ])
            ->withCount(['products'])
            ->latest()
            ->paginate(10);

        return $this
            ->httpResponse()
            ->setData(OrderResource::collection($orders))
            ->toApiResponse();
    }

    /**
     * Get order detail
     *
     * @group Orders
     *
     * @param int $id
     * @return JsonResponse
     *
     * @authenticated
     *
     */
    public function show(int $id, Request $request)
    {
        $order = Order::query()
            ->where([
                'user_id' => $request->user()->id,
                'id' => $id,
                'is_finished' => 1,
            ])
            ->with(['products', 'shipment', 'payment'])
            ->firstOrFail();

        return $this
            ->httpResponse()
            ->setData(new OrderDetailResource($order))
            ->toApiResponse();
    }
}
