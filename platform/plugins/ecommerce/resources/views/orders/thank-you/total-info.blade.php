@if (
    $order->sub_total != $order->amount
    || $order->shipping_method->getValue()
    || (EcommerceHelper::isTaxEnabled() && (float) $order->tax_amount)
    || (float) $order->discount_amount
)
    <hr class="border-dark-subtle" />
@endif

@if ($order->sub_total != $order->amount)
    @include('plugins/ecommerce::orders.thank-you.total-row', [
        'label' => __('Subtotal'),
        'value' => format_price($order->sub_total),
    ])
@endif

@if ($order->shipping_method->getValue())
    @include('plugins/ecommerce::orders.thank-you.total-row', [
        'label' =>
            __('Shipping fee') .
            ($order->is_free_shipping
                ? ' <small>(' . __('Using coupon code') . ': <strong>' . $order->coupon_code . '</strong>)</small>'
                : ''),
        'value' => $order->shipping_method_name . ((float) $order->shipping_amount ? ' - ' . format_price($order->shipping_amount) : ' - ' . __('Free')),
    ])
@endif

@if (EcommerceHelper::isTaxEnabled() && (float) $order->tax_amount)
    @include('plugins/ecommerce::orders.thank-you.total-row', [
        'label' => __('Tax'),
        'value' => format_price($order->tax_amount),
    ])
@endif

@if ((float) $order->discount_amount)
    @include('plugins/ecommerce::orders.thank-you.total-row', [
        'label' => __('Discount'),
        'value' =>
            format_price($order->discount_amount) .
            ($order->coupon_code
                ? ' <small>(' . __('Using coupon code') . ': <strong>' . $order->coupon_code . '</strong>)</small>'
                : ''),
    ])
@endif

{!! apply_filters('ecommerce_thank_you_total_info', null, $order) !!}

<hr class="border-dark-subtle" />

<div class="row">
    <div class="col-6">
        <p>{{ __('Total') }}:</p>
    </div>
    <div class="col-6 float-end">
        <p class="total-text raw-total-text"> {{ format_price($order->amount) }} </p>
    </div>
</div>
