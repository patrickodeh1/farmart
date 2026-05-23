@extends(EcommerceHelper::viewPath('customers.master'))

@section('title', __('Address books'))

@section('content')
    @if($addresses->isNotEmpty())
        <div class="dashboard-address">
            @if ($addresses->isNotEmpty())
                <div class="row row-cols-md-2 row-cols-1 g-3">
                    @foreach ($addresses as $address)
                        @include(EcommerceHelper::viewPath('customers.address.item'), ['address' => $address])
                    @endforeach
                </div>
            @endif

            <div class="d-flex justify-content-between align-items-start mt-4">
                <a class="btn btn-primary" href="{{ route('customer.address.create') }}">
                    {{ __('Add a new address') }}
                </a>
            </div>
        </div>
    @else
        @include(EcommerceHelper::viewPath('customers.partials.empty-state'), [
            'title' => __('No addresses!'),
            'subtitle' => __('You have not added any addresses yet.'),
            'actionUrl' => route('customer.address.create'),
            'actionLabel' => __('Add a new address'),
        ])
    @endif
@endsection
