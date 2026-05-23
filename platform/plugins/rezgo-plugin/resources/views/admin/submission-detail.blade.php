@extends('core/base::layouts/master')

@section('content')
<div class="container-xl">
    <div class="page-wrapper">
        <div class="container-xl">
            <div class="page-header d-print-none">
                <div class="row align-items-center">
                    <div class="col">
                        <h2 class="page-title">{{ __('Submission Details') }} #{{ $submission->order_id }}</h2>
                    </div>
                    <div class="col-auto">
                        <div class="btn-group" role="group">
                            <a href="{{ route('rezgo.index') }}" class="btn btn-link">{{ __('Settings') }}</a>
                            <a href="{{ route('rezgo.product-mappings.index') }}" class="btn btn-link">{{ __('Product Mappings') }}</a>
                            <a href="{{ route('rezgo.submit-order.form') }}" class="btn btn-link">{{ __('Submit Order') }}</a>
                            <a href="{{ route('rezgo.submissions.index') }}" class="btn btn-link">{{ __('Submissions') }}</a>
                            <a href="{{ route('rezgo.logs.index') }}" class="btn btn-link">{{ __('Logs') }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-body">
            <div class="container-xl">
                <div class="row row-cards">
                    <!-- Info Card -->
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">{{ __('Information') }}</h3>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label">{{ __('Order ID') }}</label>
                                    <div class="form-control-plaintext">#{{ $submission->order_id }}</div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">{{ __('Rezgo Booking ID') }}</label>
                                    <div class="form-control-plaintext">{{ $submission->rezgo_booking_id ?? '—' }}</div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">{{ __('Status') }}</label>
                                    <div>
                                        <span class="badge bg-{{ $submission->status === 'success' ? 'success' : 'danger' }} fs-6 text-white">
                                            {{ ucfirst($submission->status) }}
                                        </span>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">{{ __('HTTP Status') }}</label>
                                    <div class="form-control-plaintext">
                                        @if ($submission->http_status)
                                            <span class="badge bg-{{ $submission->http_status >= 200 && $submission->http_status < 300 ? 'success' : 'danger' }} text-white">
                                                {{ $submission->http_status }}
                                            </span>
                                        @else
                                            —
                                        @endif
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">{{ __('Submitted At') }}</label>
                                    <div class="form-control-plaintext">{{ $submission->created_at->format('M d, Y H:i:s') }}</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Request & Response -->
                    <div class="col-lg-8">
                        <div class="card mb-3">
                            <div class="card-header">
                                <h3 class="card-title">{{ __('Request Payload') }}</h3>
                            </div>
                            <div class="card-body">
                                <pre class="bg-light p-3 rounded" style="max-height: 400px; overflow: auto;">{{ $submission->request_payload }}</pre>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">{{ __('Response Payload') }}</h3>
                            </div>
                            <div class="card-body">
                                <pre class="bg-light p-3 rounded" style="max-height: 400px; overflow: auto;">{{ $submission->response_payload }}</pre>
                            </div>
                        </div>

                        @if ($submission->error_message)
                            <div class="card mt-3">
                                <div class="card-header bg-danger">
                                    <h3 class="card-title text-white">{{ __('Error Message') }}</h3>
                                </div>
                                <div class="card-body">
                                    <div class="alert alert-danger mb-0">
                                        {{ $submission->error_message }}
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
