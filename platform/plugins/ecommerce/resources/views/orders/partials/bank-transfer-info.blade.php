<div class="alert alert-info mt-3">
    {!! BaseHelper::clean($bankInfo) !!}
    <p class="mt-2 text-muted">{!! BaseHelper::clean(
        __('Bank transfer amount: <strong>:amount</strong>', ['amount' => format_price($orderAmount)]),
    ) !!}</p>
    <p class="mt-1 text-muted">{!! BaseHelper::clean(
        __('Bank transfer description: <strong>Payment for order :code</strong>', ['code' => str_replace('#', '', $orderCode)]),
    ) !!}</p>
</div>
