@extends('core/base::layouts/master')

@section('content')
<div class="container-xl">
    <div class="page-wrapper">
        <div class="container-xl">
            <div class="page-header d-print-none">
                <div class="row align-items-center">
                    <div class="col">
                        <h2 class="page-title">{{ __('Rezgo Connector Settings') }}</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-body">
            <div class="container-xl">
                @if ($errors->any())
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <div class="alert-title">{{ __('Error') }}</div>
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        <a class="btn-close" data-bs-dismiss="alert"></a>
                    </div>
                @endif

                @if (session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session('success') }}
                        <a class="btn-close" data-bs-dismiss="alert"></a>
                    </div>
                @endif

                <div class="row row-cards">
                    <!-- Statistics Cards -->
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-muted text-sm font-semibold">{{ __('Total Submissions') }}</div>
                                <div class="text-lg font-bold">{{ $submissionsCount }}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-muted text-sm font-semibold">{{ __('Successful') }}</div>
                                <div class="text-lg font-bold text-success">{{ $successCount }}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-muted text-sm font-semibold">{{ __('Failed') }}</div>
                                <div class="text-lg font-bold text-danger">{{ $failedCount }}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-muted text-sm font-semibold">{{ __('Product Mappings') }}</div>
                                <div class="text-lg font-bold text-primary">{{ $mappingsCount }}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Settings Form -->
                <div class="row row-cards mt-4">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">{{ __('API Configuration') }}</h3>
                            </div>
                            <form action="{{ route('rezgo.settings.update') }}" method="POST">
                                @csrf
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label class="form-label">{{ __('Rezgo CID') }}</label>
                                        <input 
                                            type="text" 
                                            class="form-control @error('rezgo_cid') is-invalid @enderror"
                                            name="rezgo_cid"
                                            value="{{ old('rezgo_cid', $decrypted_cid ?? '') }}"
                                            placeholder="Enter your Rezgo CID"
                                        >
                                        @error('rezgo_cid')<div class="invalid-feedback">{{ $message }}</div>@enderror
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">{{ __('Rezgo API Key') }}</label>
                                        <input
                                            type="text"
                                            class="form-control @error('rezgo_api_key') is-invalid @enderror"
                                            name="rezgo_api_key"
                                            value="{{ old('rezgo_api_key', $decrypted_api_key ?? '') }}"
                                            placeholder="Enter your Rezgo API Key"
                                        >
                                        @error('rezgo_api_key')<div class="invalid-feedback">{{ $message }}</div>@enderror
                                        <small class="text-muted">{{ __('Your API key is encrypted and stored securely') }}</small>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">{{ __('Default Passenger Type') }}</label>
                                        <select class="form-control @error('default_passenger_type') is-invalid @enderror" name="default_passenger_type">
                                            <option value="adult" {{ old('default_passenger_type', $settings['default_passenger_type'] ?? 'adult') === 'adult' ? 'selected' : '' }}>{{ __('Adult') }}</option>
                                            <option value="child" {{ old('default_passenger_type', $settings['default_passenger_type'] ?? 'adult') === 'child' ? 'selected' : '' }}>{{ __('Child') }}</option>
                                            <option value="senior" {{ old('default_passenger_type', $settings['default_passenger_type'] ?? 'adult') === 'senior' ? 'selected' : '' }}>{{ __('Senior') }}</option>
                                        </select>
                                        @error('default_passenger_type')<div class="invalid-feedback">{{ $message }}</div>@enderror
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">{{ __('Booking Date Offset (Days)') }}</label>
                                        <input 
                                            type="number" 
                                            class="form-control @error('booking_date_offset') is-invalid @enderror"
                                            name="booking_date_offset"
                                            value="{{ old('booking_date_offset', $settings['booking_date_offset'] ?? 1) }}"
                                            min="0"
                                            max="365"
                                        >
                                        <small class="text-muted">{{ __('Days from today to book inventory') }}</small>
                                        @error('booking_date_offset')<div class="invalid-feedback">{{ $message }}</div>@enderror
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-check">
                                            <input type="checkbox" class="form-check-input" name="sync_enabled" value="1" {{ old('sync_enabled', $settings['sync_enabled'] ?? false) ? 'checked' : '' }}>
                                            <span class="form-check-label">{{ __('Enable Order Synchronization') }}</span>
                                        </label>
                                        <small class="text-muted d-block">{{ __('Enable automatic order submission to Rezgo') }}</small>
                                    </div>
                                </div>
                                <div class="card-footer text-end">
                                    <a href="{{ route('rezgo.test-connection') }}" class="btn btn-link">{{ __('Test Connection') }}</a>
                                    <button type="submit" class="btn btn-primary">{{ __('Save Settings') }}</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Navigation -->
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">{{ __('Quick Navigation') }}</h3>
                            </div>
                            <div class="card-body">
                                <div class="list-group list-group-transparent">
                                    <a href="{{ route('rezgo.product-mappings.index') }}" class="list-group-item list-group-item-action">
                                        {{ __('Product Mappings') }}
                                        <span class="badge bg-primary text-white float-end">{{ $mappingsCount }}</span>
                                    </a>
                                    <a href="{{ route('rezgo.submit-order.form') }}" class="list-group-item list-group-item-action">
                                        {{ __('Submit Order') }}
                                    </a>
                                    <a href="{{ route('rezgo.submissions.index') }}" class="list-group-item list-group-item-action">
                                        {{ __('Submissions') }}
                                        <span class="badge bg-info text-white float-end">{{ $submissionsCount }}</span>
                                    </a>
                                    <a href="{{ route('rezgo.logs.index') }}" class="list-group-item list-group-item-action">
                                        {{ __('Activity Logs') }}
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Recent Logs -->
                        <div class="card mt-3">
                            <div class="card-header">
                                <h3 class="card-title">{{ __('Recent Activity') }}</h3>
                            </div>
                            <div class="card-body" style="max-height: 400px; overflow-y: auto;">
                                @forelse ($recentLogs as $log)
                                    <div class="mb-2 pb-2 border-bottom">
                                        <small class="text-muted">{{ $log->created_at->diffForHumans() }}</small>
                                        <div class="small">
                                            <span class="badge bg-{{ $log->log_type === 'error' ? 'danger' : ($log->log_type === 'warning' ? 'warning' : 'success') }} text-white">
                                                {{ strtoupper($log->log_type) }}
                                            </span>
                                            {{ $log->message }}
                                        </div>
                                    </div>
                                @empty
                                    <p class="text-muted small">{{ __('No recent activity') }}</p>
                                @endforelse
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Import Inventory Section (FIX 6) -->
                @if (!empty($tours))
<div class="card mt-4">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h3 class="card-title">Rezgo Inventory ({{ count($tours) }} tours)</h3>
        <input type="text" id="tour-search" class="form-control w-auto"
               placeholder="Search tours..." style="max-width:250px;">
    </div>
    <div class="card-body p-0">
        <table class="table table-vcenter" id="tours-table">
            <thead>
                <tr>
                    <th>Tour</th>
                    <th>UID</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($tours as $tour)
                @php
                    $uid = $tour['uid'] ?? $tour['item'] ?? '';
                    $title = $tour['name'] ?? $tour['item'] ?? 'Unknown';
                    $isImported = in_array($uid, $importedUids);
                @endphp
                <tr class="tour-row" data-name="{{ strtolower($title) }}">
                    <td>{{ $title }}</td>
                    <td><code>{{ $uid }}</code></td>
                    <td>
                        @if ($isImported)
                            <span class="badge bg-success">Imported</span>
                        @else
                            <span class="badge bg-secondary">Not imported</span>
                        @endif
                    </td>
                    <td>
                        @if (!$isImported)
                        <form action="{{ route('rezgo.import-as-draft') }}" method="POST"
                              style="display:inline;">
                            @csrf
                            <input type="hidden" name="rezgo_uid" value="{{ $uid }}">
                            <input type="hidden" name="rezgo_title" value="{{ $title }}">
                            <button type="submit" class="btn btn-sm btn-primary">
                                Import as Draft
                            </button>
                        </form>
                        @else
                            <span class="text-muted small">Already imported</span>
                        @endif
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="card-footer d-flex justify-content-between align-items-center">
        <div id="pagination-info" class="text-muted small"></div>
        <div id="pagination-controls"></div>
    </div>
</div>

<script>
(function() {
    const rowsPerPage = 20;
    let currentPage = 1;
    let visibleRows = [];

    const table   = document.getElementById('tours-table');
    const search  = document.getElementById('tour-search');
    const info    = document.getElementById('pagination-info');
    const controls = document.getElementById('pagination-controls');

    function getRows() {
        return Array.from(table.querySelectorAll('tbody .tour-row'));
    }

    function filterRows() {
        const q = search.value.toLowerCase();
        visibleRows = getRows().filter(row => {
            const match = !q || row.dataset.name.includes(q);
            row.style.display = 'none';
            return match;
        });
        currentPage = 1;
        renderPage();
    }

    function renderPage() {
        const start = (currentPage - 1) * rowsPerPage;
        const end   = start + rowsPerPage;
        getRows().forEach(r => r.style.display = 'none');
        visibleRows.slice(start, end).forEach(r => r.style.display = '');
        info.textContent = `Showing ${Math.min(start+1, visibleRows.length)}–${Math.min(end, visibleRows.length)} of ${visibleRows.length}`;
        renderControls();
    }

    function renderControls() {
        const pages = Math.ceil(visibleRows.length / rowsPerPage);
        controls.innerHTML = '';
        if (pages <= 1) return;
        for (let i = 1; i <= pages; i++) {
            const btn = document.createElement('button');
            btn.textContent = i;
            btn.className = 'btn btn-sm ' + (i === currentPage ? 'btn-primary' : 'btn-outline-secondary') + ' ms-1';
            btn.addEventListener('click', () => { currentPage = i; renderPage(); });
            controls.appendChild(btn);
        }
    }

    search.addEventListener('input', filterRows);
    visibleRows = getRows();
    renderPage();
})();
</script>
@endif
            </div>
        </div>
    </div>
</div>
@endsection
