@extends('core/base::layouts/master')

@section('content')
<div class="container-xl">
    <div class="page-wrapper">
        <div class="container-xl">
            <div class="page-header d-print-none">
                <div class="row align-items-center">
                    <div class="col">
                        <h2 class="page-title">{{ __('Submit Order to Rezgo') }}</h2>
                    </div>
                    <div class="col-auto">
                        <div class="btn-group" role="group">
                            <a href="{{ route('rezgo.index') }}" class="btn btn-link">{{ __('Settings') }}</a>
                            <a href="{{ route('rezgo.product-mappings.index') }}" class="btn btn-link">{{ __('Product Mappings') }}</a>
                            <a href="{{ route('rezgo.submissions.index') }}" class="btn btn-link">{{ __('Submissions') }}</a>
                            <a href="{{ route('rezgo.logs.index') }}" class="btn btn-link">{{ __('Logs') }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-body">
            <div class="container-xl">
                @if (session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session('success') }}
                        <a class="btn-close" data-bs-dismiss="alert"></a>
                    </div>
                @endif

                @if (session('error'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{ session('error') }}
                        <a class="btn-close" data-bs-dismiss="alert"></a>
                    </div>
                @endif

                <div class="row row-cards">
                    <!-- Available Orders List -->
                    @if ($orders && count($orders) > 0)
                    <div class="col-12">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table table-vcenter">
                                    <thead>
                                        <tr>
                                            <th>{{ __('Order ID') }}</th>
                                            <th>{{ __('Customer') }}</th>
                                            <th>{{ __('Products') }}</th>
                                            <th>{{ __('Total') }}</th>
                                            <th>{{ __('Date') }}</th>
                                            <th>{{ __('Tour Date') }}</th>
                                            <th>{{ __('Action') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($orders as $order)
                                        <tr>
                                            <td>
                                                <strong>#{{ $order['id'] }}</strong>
                                            </td>
                                            <td>
                                                {{ $order['customer_name'] }}
                                            </td>
                                            <td>
                                                <div class="small">
                                                    @foreach ($order['products'] as $product)
                                                            <div>
                                                            <span class="badge bg-{{ $product['mapped'] ? 'success' : 'warning' }} text-white">
                                                                {{ $product['product_name'] }} (x{{ $product['quantity'] }})
                                                            </span>
                                                            @if ($product['mapped'])
                                                                <br><small class="text-muted">
                                                                    → {{ $product['rezgo_title'] }}
                                                                </small>
                                                            @else
                                                                <br><small class="text-danger">⚠ No mapping</small>
                                                            @endif
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </td>
                                            <td>
                                                ${{ number_format($order['total'], 2) }}
                                            </td>
                                            <td>
                                                {{ \Carbon\Carbon::parse($order['created_at'])->format('M d, Y') }}
                                            </td>
                                            <td>
                                                @php
                                                    $meta = $rezgoMeta[$order['id']] ?? null;
                                                    $savedDate = $meta ? $meta->tour_date : null;
                                                @endphp
                                                <form action="{{ route('rezgo.submit-order') }}" method="POST" style="display:inline;">
                                                    @csrf
                                                    <input type="hidden" name="order_id" value="{{ $order['id'] }}">
                                                    @if ($savedDate)
                                                        {{-- Date from customer selection -- show as read-only with option to override --}}
                                                        <input type="date"
                                                               name="tour_date"
                                                               class="form-control form-control-sm"
                                                               value="{{ $savedDate }}"
                                                               min="{{ \Carbon\Carbon::now()->format('Y-m-d') }}"
                                                               required
                                                               style="max-width:150px;display:inline-block;">
                                                        <small class="text-success d-block">✓ Customer selected</small>
                                                    @else
                                                        {{-- No saved date -- manual entry --}}
                                                        <input type="date"
                                                               name="tour_date"
                                                               class="form-control form-control-sm"
                                                               value="{{ \Carbon\Carbon::now()->addDay()->format('Y-m-d') }}"
                                                               min="{{ \Carbon\Carbon::now()->format('Y-m-d') }}"
                                                               required
                                                               style="max-width:150px;display:inline-block;">
                                                        <small class="text-muted d-block">Manual entry</small>
                                                    @endif
                                                    <button type="submit" class="btn btn-sm btn-primary mt-1">
                                                        {{ __('Submit') }}
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    @else
                    <div class="col-12">
                        <div class="alert alert-info" role="alert">
                            {{ __('No orders available for submission.') }}
                        </div>
                    </div>
                    @endif

                    <!-- Instructions -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">{{ __('Instructions') }}</h3>
                            </div>
                            <div class="card-body">
                                <ul>
                                    <li><strong>Product Status:</strong> 
                                        <span class="badge bg-success">Green</span> = Mapped to Rezgo tour | 
                                        <span class="badge bg-warning">Yellow</span> = No mapping configured
                                    </li>
                                    <li><strong>Availability:</strong>
                                        <span class="badge bg-info">Avail: N</span> = How many spots available (shown next to tour name)
                                        <span class="badge bg-danger">Avail: 0</span> = No availability - choose different tour or date
                                    </li>
                                    <li>{{ __('Only submit orders where all products have Rezgo mappings') }}</li>
                                    <li><strong>Tour Date:</strong> Select a date when the tour has availability (see Avail count)</li>
                                    <li>{{ __('Click "Submit" to send the order to Rezgo API') }}</li>
                                    <li>{{ __('Check the "View Submissions" page to see results and any error messages') }}</li>
                                    <li><strong>Price:</strong> Pricing is managed in Rezgo; $0 in submissions means the booking was recorded without local pricing data</li>
                                </ul>
                                <div class="alert alert-info mt-3">
                                    <strong>Troubleshooting:</strong>
                                    If you get "Availability Error", the tour has no spots available on that date. Try a different date or different product with a tour that has availability.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
