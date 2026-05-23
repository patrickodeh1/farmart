<?php

namespace Botble\Mollie\Http\Controllers;

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Models\Payment;
use Botble\Payment\Supports\PaymentHelper;
use Illuminate\Http\Request;
use Mollie\Api\Exceptions\ApiException;
use Mollie\Api\Types\PaymentStatus;
use Mollie\Laravel\Facades\Mollie;

class MollieController extends BaseController
{
    public function paymentCallback(string $token, Request $request, BaseHttpResponse $response)
    {
        try {
            $api = Mollie::api();

            $paymentId = $request->input('id');

            if (! $paymentId) {
                $message = __('Payment failed! Missing transaction ID.');

                return $response
                    ->setError()
                    ->setNextUrl(PaymentHelper::getCancelURL($token) . '&error_message=' . $message)
                    ->setMessage($message);
            }

            $payment = Payment::query()->where('charge_id', $paymentId)->first();

            if ($payment && $payment->status == PaymentStatusEnum::COMPLETED) {
                return $response
                    ->setNextUrl(PaymentHelper::getRedirectURL($token) . '?charge_id=' . $paymentId)
                    ->setMessage(__('Checkout successfully!'));
            }

            do_action('payment_before_making_api_request', MOLLIE_PAYMENT_METHOD_NAME, ['payment_id' => $paymentId]);

            $result = $api->payments->get($paymentId);

            do_action('payment_after_api_response', MOLLIE_PAYMENT_METHOD_NAME, ['payment_id' => $paymentId], (array) $result);

        } catch (ApiException $exception) {
            BaseHelper::logError($exception);

            return $response
                ->setError()
                ->setNextUrl(PaymentHelper::getCancelURL($token) . '&error_message=' . $exception->getMessage())
                ->setMessage($exception->getMessage());
        }

        if (in_array($result->status, [
            PaymentStatus::STATUS_CANCELED,
            PaymentStatus::STATUS_EXPIRED,
            PaymentStatus::STATUS_FAILED,
        ])) {
            return $response
                ->setError()
                ->setNextUrl(PaymentHelper::getCancelURL($token))
                ->setMessage(__('Payment failed! Status: :status', ['status' => $result->status]));
        }

        if (! $result->isPaid()) {
            return $response
                ->setError()
                ->setNextUrl(PaymentHelper::getCancelURL($token))
                ->setMessage(__('Error when processing payment via :paymentType!', ['paymentType' => 'Mollie']));
        }

        $status = PaymentStatusEnum::COMPLETED;

        if (in_array($result->status, [PaymentStatus::STATUS_OPEN, PaymentStatus::STATUS_AUTHORIZED])) {
            $status = PaymentStatusEnum::PENDING;
        }

        $orderIds = (array) $result->metadata->order_id;

        do_action(PAYMENT_ACTION_PAYMENT_PROCESSED, [
            'amount' => $result->amount->value,
            'currency' => $result->amount->currency,
            'charge_id' => $result->id,
            'payment_channel' => MOLLIE_PAYMENT_METHOD_NAME,
            'status' => $status,
            'customer_id' => $result->metadata->customer_id,
            'customer_type' => $result->metadata->customer_type,
            'payment_type' => 'direct',
            'order_id' => $orderIds,
        ]);

        return $response
            ->setNextUrl(PaymentHelper::getRedirectURL($token) . '?charge_id=' . $result->id)
            ->setMessage(__('Checkout successfully!'));
    }
}
