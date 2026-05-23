@extends('core/base::layouts/master')

@section('content')
<div class="container-xl">
    <div class="page-wrapper">
        <div class="container-xl">
            <div class="page-header d-print-none">
                <div class="row align-items-center">
                    <div class="col">
                        <h2 class="page-title">{{ __('Product Mappings') }}</h2>
                    </div>
                    <div class="col-auto">
                        <div class="btn-group" role="group">
                            <a href="{{ route('rezgo.index') }}" class="btn btn-link">{{ __('Settings') }}</a>
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
                    <div class="col-12">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table table-vcenter table-hover">
                                    <thead>
                                        <tr>
                                            <th>{{ __('Product') }}</th>
                                            <th style="width: 40%;">{{ __('Rezgo Inventory') }}</th>
                                            <th>{{ __('Passenger Type') }}</th>
                                            <th>{{ __('Status') }}</th>
                                            <th style="width: 150px;">{{ __('Actions') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($mappings as $mapping)
                                            <tr>
                                                <td>
                                                    <strong>{{ $mapping->product->name ?? 'N/A' }}</strong>
                                                </td>
                                                <td style="word-break: break-word;">
                                                    <small>{{ $mapping->rezgo_title ?? '—' }}</small>
                                                </td>
                                                <td>
                                                    {{ ucfirst($mapping->passenger_type) }}
                                                </td>
                                                <td>
                                                    {{ $mapping->is_active ? __('Active') : __('Inactive') }}
                                                </td>
                                                <td>
                                                    <a
                                                        class="btn btn-icon btn-primary"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#mapModal"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-original-title="{{ __('Edit mapping') }}"
                                                        href="#"
                                                        onclick="setMappingData({{ $mapping->id }}, {{ $mapping->product_id }}, '{{ $mapping->rezgo_uid }}', '{{ $mapping->rezgo_title }}', '{{ $mapping->passenger_type }}'); return false;"
                                                    >
                                                        <x-core::icon name="ti ti-pencil" />
                                                    </a>
                                                    <form action="{{ route('rezgo.product-mappings.delete', $mapping->id) }}" method="POST" style="display: inline;">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button
                                                            type="submit"
                                                            class="btn btn-icon btn-danger"
                                                            data-bs-toggle="tooltip"
                                                            data-bs-original-title="{{ __('Delete mapping') }}"
                                                            onclick="return confirm('{{ __('Are you sure?') }}')"
                                                        >
                                                            <x-core::icon name="ti ti-trash" />
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="5" class="text-center text-muted py-4">
                                                    {{ __('No product mappings configured') }}
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>

                            @if ($mappings->hasPages())
                                <div class="card-footer d-flex align-items-center">
                                    {{ $mappings->links() }}
                                </div>
                            @endif
                        </div>
                    </div>

                    <!-- Available Rezgo Inventory -->
                    @if ($rezgoTours)
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h3 class="card-title">{{ __('Available Rezgo Inventory') }}</h3>
                                    @if($totalInventoryCount > 0)
                                        <span class="badge bg-info text-white">{{ $totalInventoryCount }} total items</span>
                                    @endif
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-vcenter">
                                        <thead>
                                            <tr>
                                                <th>{{ __('Inventory Name') }}</th>
                                                <th>{{ __('UID') }}</th>
                                                <th>{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($rezgoTours as $tour)
                                                <tr>
                                                    <td>
                                                        <strong>{{ $tour['name'] ?? $tour['item'] ?? 'N/A' }}</strong>
                                                        @if (isset($tour['option']) && $tour['option'])
                                                            <br><small class="text-muted">{{ $tour['option'] }}</small>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        <code>{{ $tour['uid'] ?? '—' }}</code>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#mapModal" onclick="setTourData('{{ $tour['uid'] ?? '' }}', '{{ $tour['name'] ?? $tour['item'] ?? '' }}', '{{ $tour['option'] ?? '' }}')">
                                                            {{ __('Map Product') }}
                                                        </button>
                                                        <form action="{{ route('rezgo.import-as-draft') }}" method="POST" style="display:inline;">
                                                            @csrf
                                                            <input type="hidden" name="rezgo_uid" value="{{ $tour['uid'] ?? '' }}">
                                                            <input type="hidden" name="rezgo_title" value="{{ $tour['name'] ?? $tour['item'] ?? '' }}">
                                                            <button type="submit" class="btn btn-sm btn-success">{{ __('Import as Draft') }}</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                @php
                                    $totalPages = ceil($totalInventoryCount / $perPage);
                                @endphp
                                @if($totalPages > 1)
                                    <div class="card-footer d-flex flex-column align-items-center">
                                        <p class="text-muted small mb-3">Showing {{ count($rezgoTours) }} of {{ $totalInventoryCount }} items (Page {{ $currentPage }} of {{ $totalPages }})</p>
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination pagination-sm">
                                                @if($currentPage > 1)
                                                    <li class="page-item">
                                                        <a class="page-link" href="{{ route('rezgo.product-mappings.index', ['rezgo_page' => $currentPage - 1]) }}">&laquo; Previous</a>
                                                    </li>
                                                @endif
                                                
                                                @for ($i = max(1, $currentPage - 2); $i <= min($totalPages, $currentPage + 2); $i++)
                                                    <li class="page-item {{ $currentPage == $i ? 'active' : '' }}">
                                                        <a class="page-link" href="{{ route('rezgo.product-mappings.index', ['rezgo_page' => $i]) }}">{{ $i }}</a>
                                                    </li>
                                                @endfor
                                                
                                                @if($currentPage < $totalPages)
                                                    <li class="page-item">
                                                        <a class="page-link" href="{{ route('rezgo.product-mappings.index', ['rezgo_page' => $currentPage + 1]) }}">Next &raquo;</a>
                                                    </li>
                                                @endif
                                            </ul>
                                        </nav>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Map Modal -->
<div class="modal modal-blur fade" id="mapModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-header">
                <h5 class="modal-title">{{ __('Map Product to Rezgo Inventory') }}</h5>
            </div>
            <form action="{{ route('rezgo.product-mappings.save') }}" method="POST">
                @csrf
                <input type="hidden" id="mappingId" name="mapping_id" value="">
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">{{ __('Product') }}</label>
                        <select class="form-control" id="productSelect" name="product_id" required>
                            <option value="">{{ __('Select a product') }}</option>
                            @forelse ($products as $product)
                                <option value="{{ $product->id }}">{{ $product->name }}</option>
                            @empty
                                <option disabled>{{ __('No products available') }}</option>
                            @endforelse
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">{{ __('Rezgo Inventory UID') }}</label>
                        <input type="text" class="form-control" name="rezgo_uid" id="rezgoUid">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">{{ __('Rezgo Inventory Title') }}</label>
                        <input type="text" class="form-control" name="rezgo_title" id="rezgoTitle">
                    </div>

                    <input type="hidden" id="rezgoOption" name="rezgo_option">

                    <div class="mb-3">
                        <label class="form-label">{{ __('Passenger Type') }}</label>
                        <select class="form-control" id="passengerType" name="passenger_type" required>
                            <option value="adult">{{ __('Adult') }}</option>
                            <option value="child">{{ __('Child') }}</option>
                            <option value="senior">{{ __('Senior') }}</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-link" data-bs-dismiss="modal">{{ __('Cancel') }}</a>
                    <button type="submit" class="btn btn-primary">{{ __('Save Mapping') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function setTourData(uid, title, option = '') {
    // New mapping mode - populate fields when modal opens
    const mapModal = document.getElementById('mapModal');
    if (mapModal) {
        const bsModal = bootstrap.Modal.getInstance(mapModal) || new bootstrap.Modal(mapModal);
        
        mapModal.addEventListener('shown.bs.modal', function populateNewMapping() {
            document.getElementById('mappingId').value = '';
            document.getElementById('productSelect').value = '';
            document.getElementById('rezgoUid').value = uid || '';
            document.getElementById('rezgoTitle').value = (title || '') + (option ? ' — ' + option : '');
            document.getElementById('rezgoOption').value = option || '';
            document.getElementById('passengerType').value = 'adult';
            mapModal.removeEventListener('shown.bs.modal', populateNewMapping);
        }, { once: true });
    }
}

function setMappingData(mappingId, productId, uid, title, passengerType) {
    // Edit mapping mode - populate fields when modal opens
    const mapModal = document.getElementById('mapModal');
    if (mapModal) {
        const bsModal = bootstrap.Modal.getInstance(mapModal) || new bootstrap.Modal(mapModal);
        
        mapModal.addEventListener('shown.bs.modal', function populateEditMapping() {
            document.getElementById('mappingId').value = mappingId || '';
            document.getElementById('productSelect').value = productId || '';
            document.getElementById('rezgoUid').value = uid || '';
            document.getElementById('rezgoTitle').value = title || '';
            document.getElementById('rezgoOption').value = '';
            document.getElementById('passengerType').value = passengerType || 'adult';
            mapModal.removeEventListener('shown.bs.modal', populateEditMapping);
        }, { once: true });
    }
}

// Reset form when modal is closed
document.addEventListener('DOMContentLoaded', function() {
    const mapModal = document.getElementById('mapModal');
    if (mapModal) {
        mapModal.addEventListener('hidden.bs.modal', function() {
            document.getElementById('mappingId').value = '';
        });
    }
});
</script>
@endsection
