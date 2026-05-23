@extends('core/base::layouts/master')

@section('content')
<div class="container-xl">
    <div class="page-wrapper">
        <div class="container-xl">
            <div class="page-header d-print-none">
                <div class="row align-items-center">
                    <div class="col">
                        <h2 class="page-title">{{ __('Rezgo Submissions') }}</h2>
                    </div>
                    <div class="col-auto">
                        <div class="btn-group" role="group">
                            <a href="{{ route('rezgo.index') }}" class="btn btn-link">{{ __('Settings') }}</a>
                            <a href="{{ route('rezgo.product-mappings.index') }}" class="btn btn-link">{{ __('Product Mappings') }}</a>
                            <a href="{{ route('rezgo.submit-order.form') }}" class="btn btn-link">{{ __('Submit Order') }}</a>
                            <a href="{{ route('rezgo.logs.index') }}" class="btn btn-link">{{ __('Logs') }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-body">
            <div class="container-xl">
                <div class="row row-cards">
                    <div class="col-12">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table table-vcenter">
                                    <thead>
                                        <tr>
                                            <th>{{ __('Order ID') }}</th>
                                            <th>{{ __('Rezgo Booking ID') }}</th>
                                            <th>{{ __('Status') }}</th>
                                            <th>{{ __('HTTP Status') }}</th>
                                            <th>{{ __('Submitted') }}</th>
                                            <th>{{ __('Actions') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($submissions as $submission)
                                            <tr>
                                                <td>
                                                    <strong>#{{ $submission->order_id }}</strong>
                                                </td>
                                                <td>
                                                    {{ $submission->rezgo_booking_id ?? '—' }}
                                                </td>
                                                <td>
                                                    <span class="badge bg-{{ $submission->status === 'success' ? 'success' : 'danger' }} text-white">
                                                        {{ ucfirst($submission->status) }}
                                                    </span>
                                                </td>
                                                <td>
                                                    @if ($submission->http_status)
                                                        <span class="badge bg-{{ $submission->http_status >= 200 && $submission->http_status < 300 ? 'success' : 'danger' }} text-white">
                                                            {{ $submission->http_status }}
                                                        </span>
                                                    @else
                                                        —
                                                    @endif
                                                </td>
                                                <td>
                                                    {{ $submission->created_at->format('M d, H:i') }}
                                                </td>
                                                <td>
                                                    <a href="{{ route('rezgo.submissions.detail', $submission->id) }}" class="btn btn-sm btn-ghost-primary">
                                                        {{ __('View') }}
                                                    </a>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="6" class="text-center text-muted py-4">
                                                    {{ __('No submissions found') }}
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>

                            @if ($submissions->hasPages())
                                <div class="card-footer d-flex align-items-center">
                                    {{ $submissions->links() }}
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
