@php
    $digitalProducts = $order->products->where('product_type', 'digital');
@endphp

@if($digitalProducts->isNotEmpty() && $order->is_finished)
    <x-core::card class="mb-3">
        <x-core::card.header>
            <x-core::card.title>
                {{ trans('plugins/ecommerce::order.digital_product_downloads.title') }}
            </x-core::card.title>
        </x-core::card.header>
        <ul class="list-group list-group-flush">
            @foreach($digitalProducts as $orderProduct)
                <li class="list-group-item">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center gap-2">
                            {{ RvMedia::image($orderProduct->image, $orderProduct->name, attributes: ['width' => 60]) }}
                            <div>
                                <a
                                    href="{{ route('products.edit', $orderProduct->product_id) }}"
                                    target="_blank"
                                    title="{{ $orderProduct->product_name }}"
                                    class="d-block"
                                >
                                    {{ $orderProduct->product_name }}
                                </a>
                                <div class="mt-1 d-inline-flex gap-2 flex-wrap">
                                    <div class="d-flex align-items-start align-items-sm-center gap-1">
                                        <x-core::icon name="ti ti-download" />
                                        {{ trans('plugins/ecommerce::order.digital_product_downloads.download_count', ['count' => number_format($orderProduct->times_downloaded)]) }}
                                    </div>
                                    <div @class(['d-flex align-items-start align-items-sm-center gap-1', 'text-warning' => ! $orderProduct->downloaded_at])>
                                        <x-core::icon name="ti ti-clock" />
                                        @if($orderProduct->downloaded_at)
                                            {{ trans('plugins/ecommerce::order.digital_product_downloads.first_download', ['time' => $orderProduct->downloaded_at]) }}
                                        @else
                                            {{ trans('plugins/ecommerce::order.digital_product_downloads.not_downloaded_yet') }}
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            @endforeach
        </ul>
    </x-core::card>
@endif
