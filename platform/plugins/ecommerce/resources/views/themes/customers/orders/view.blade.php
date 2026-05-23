@extends(EcommerceHelper::viewPath('customers.master'))

@section('title', __('Order information'))

@section('content')
    <div class="customer-order-detail">
        @include(EcommerceHelper::viewPath('includes.order-tracking-detail'))

        @if ($order->canBeCanceled())
            <x-core::form method="post" :files="true" class="bg-body-tertiary p-3 my-3 customer-order-upload-receipt" :url="route('customer.orders.upload-proof', $order)">
                <div>
                    <label for="file" class="fw-medium">
                        @if (! $order->proof_file)
                            {{ __('The order is currently being processed. For expedited processing, kindly upload a copy of your payment proof:') }}
                        @else
                            {{ __('You have uploaded a copy of your payment proof.') }}
                            <p class="mb-1">{{ __('View Receipt:') }}<a href="{{ route('customer.orders.download-proof', $order) }}" target="_blank" class="btn-link ms-1">{{ $order->proof_file }}</a></p>
                            <p class="my-1 fw-medium">{{ __('Or you can upload a new one, the old one will be replaced.') }}</p>
                        @endif
                    </label>
                    <div class="d-flex">
                        <input type="file" name="file" id="file" class="form-control">
                        <button type="submit" class="btn btn-primary ms-2">{{ __('Upload') }}</button>
                    </div>
                    <small class="text-muted">{{ __('You can upload the following file types: jpg, jpeg, png, pdf and max file size is 2MB.') }}</small>
                </div>
            </x-core::form>
        @elseif ($order->proof_file)
            <div class="bg-body-tertiary p-3 my-3 customer-order-upload-receipt">
                <label for="file" class="fw-medium">
                    {{ __('You have uploaded a copy of your payment proof.') }}
                    <p class="mb-1">{{ __('View Receipt:') }}<a href="{{ route('customer.orders.download-proof', $order) }}" target="_blank" class="btn-link ms-1">{{ $order->proof_file }}</a></p>
                </label>
            </div>
        @endif

        <div class="mt-3">
            <div class="d-flex flex-wrap gap-2">
                @if($order->shipment->can_confirm_delivery)
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmDeliveredModal" data-toggle="modal" data-target="#confirmDeliveredModal">
                        <x-core::icon name="ti ti-check" />
                        {{ __('Confirm Delivery') }}
                    </button>
                @endif
                @if ($order->isInvoiceAvailable())
                    <a class="btn btn-success" href="{{ route('customer.print-order', $order->id) }}?type=print" target="_blank">
                        {{ __('Print invoice') }}
                    </a>
                    <a class="btn btn-success" href="{{ route('customer.print-order', $order->id) }}">
                        {{ __('Download invoice') }}
                    </a>
                @endif
                    @if ($order->canBeCanceled())
                    <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal-cancel-order" data-toggle="modal" data-target="#modal-cancel-order">
                        {{ __('Cancel order') }}
                    </a>
                @endif
                @if ($order->canBeReturned())
                    <a class="btn btn-danger" href="{{ route('customer.order_returns.request_view', $order->id) }}">
                        {{ __('Return Product(s)') }}
                    </a>
                @endif
            </div>
        </div>
    </div>

    @if ($order->canBeCanceled())
        <div class="modal fade" id="modal-cancel-order" tabindex="-1" aria-labelledby="modalCancelOrderLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header align-items-start">
                        <div>
                            <h4 class="modal-title fs-5" id="modalCancelOrderLabel">{{ __('Cancel Order') }}</h4>
                            <p class="text-muted mb-0">{{ __('Please provide a reason for the cancellation.') }}</p>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        {!! $cancelOrderForm->renderForm() !!}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('Close') }}</button>
                        <button type="submit" class="btn btn-primary" form="cancel-order-form">{{ __('Submit') }}</button>
                    </div>
                </div>
            </div>
        </div>
    @endif

    @if($order->shipment->can_confirm_delivery)
        <div class="modal fade" id="confirmDeliveredModal" tabindex="-1" aria-labelledby="confirmDeliveredModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <button type="button" class="btn-close position-absolute" data-bs-dismiss="modal" aria-label="Close" style="top: 1rem; inset-inline-end: 1rem; z-index: 1000"></button>
                    <form action="{{ route('customer.orders.confirm-delivery', $order) }}" method="post" class="modal-body text-center my-3">
                        @csrf
                        <h5 class="modal-title fs-5 mb-2" id="confirmDeliveredModalLabel">{{ __('Confirm Delivery') }}</h5>
                        <p class="mb-4">{{ __('Are you sure you have received your order? Please confirm that the package has been delivered to you?') }}</p>
                        <div class="d-flex justify-content-center">
                            <button type="button" class="w-50 btn btn-secondary me-2" data-bs-dismiss="modal">{{ __('Close') }}</button>
                            <button type="submit" class="w-50 btn btn-primary">{{ __('Confirm') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    @endif
@stop
