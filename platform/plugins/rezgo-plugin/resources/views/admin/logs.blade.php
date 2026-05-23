@extends('core/base::layouts/master')

@section('content')
<div class="container-xl">
    <div class="page-wrapper">
        <div class="container-xl">
            <div class="page-header d-print-none">
                <div class="row align-items-center">
                    <div class="col">
                        <h2 class="page-title">{{ __('Activity Logs') }}</h2>
                    </div>
                    <div class="col-auto">
                        <div class="btn-group" role="group">
                            <a href="{{ route('rezgo.index') }}" class="btn btn-link">{{ __('Settings') }}</a>
                            <a href="{{ route('rezgo.product-mappings.index') }}" class="btn btn-link">{{ __('Product Mappings') }}</a>
                            <a href="{{ route('rezgo.submit-order.form') }}" class="btn btn-link">{{ __('Submit Order') }}</a>
                            <a href="{{ route('rezgo.submissions.index') }}" class="btn btn-link">{{ __('Submissions') }}</a>
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
                                <table class="table table-vcenter table-striped">
                                    <thead>
                                        <tr>
                                            <th>{{ __('Time') }}</th>
                                            <th>{{ __('Type') }}</th>
                                            <th>{{ __('Operation') }}</th>
                                            <th>{{ __('Message') }}</th>
                                            <th>{{ __('Related ID') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($logs as $log)
                                            <tr>
                                                <td>
                                                    <small class="text-muted">{{ $log->created_at->format('M d, H:i:s') }}</small>
                                                </td>
                                                <td>
                                                    <span class="badge bg-{{ $log->log_type === 'error' ? 'danger' : ($log->log_type === 'warning' ? 'warning' : 'success') }} text-white">
                                                        {{ strtoupper($log->log_type) }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <code>{{ $log->operation }}</code>
                                                </td>
                                                <td>
                                                    {{ $log->message }}
                                                </td>
                                                <td>
                                                    {{ $log->related_id ?? '—' }}
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="5" class="text-center text-muted py-4">
                                                    {{ __('No logs found') }}
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>

                            @if ($logs->hasPages())
                                <div class="card-footer d-flex align-items-center">
                                    {{ $logs->links() }}
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
