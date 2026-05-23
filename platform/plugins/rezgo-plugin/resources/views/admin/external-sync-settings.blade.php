@extends(BaseHelper::getAdminMasterLayoutTemplate())

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">External Database Sync Connection Status</h5>
                    </div>
                    <div class="card-body">
                        @if(!empty($connectionStatus) && is_array($connectionStatus))
                            @if(isset($connectionStatus['success']) && $connectionStatus['success'])
                                <div class="alert alert-success">
                                    <i class="fas fa-check-circle"></i> <strong>✓ Connected</strong>
                                    <br>{{ $connectionStatus['message'] ?? 'Connection successful' }}
                                </div>
                            @else
                                <div class="alert alert-danger">
                                    <i class="fas fa-times-circle"></i> <strong>✗ Not Connected</strong>
                                    <br>{{ $connectionStatus['message'] ?? 'Connection failed' }}
                                </div>
                            @endif
                        @elseif($enabled)
                            <div class="alert alert-warning">
                                <i class="fas fa-info-circle"></i> <strong>⊝ Not Configured</strong>
                                <br>External sync is enabled but credentials are missing. Set DZM_COATAA_DB_* variables in .env
                            </div>
                        @else
                            <div class="alert alert-secondary">
                                <i class="fas fa-ban"></i> <strong>○ Disabled</strong>
                                <br>External sync is disabled. Set REZGO_EXTERNAL_SYNC_ENABLED=true in .env to enable
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

