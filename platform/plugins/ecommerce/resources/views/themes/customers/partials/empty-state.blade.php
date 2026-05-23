<div class="bb-empty">
    <div class="bb-empty-img">
        <x-plugins-ecommerce::empty-state />
    </div>
    <p class="bb-empty-title">{{ $title }}</p>
    <p class="bb-empty-subtitle text-secondary">
        {{ $subtitle }}
    </p>
    @if (isset($actionUrl) && isset($actionLabel))
        <div class="bb-empty-action">
            <x-core::button
                color="primary"
                tag="a"
                :href="$actionUrl"
            >
                {{ $actionLabel }}
            </x-core::button>
        </div>
    @endif
</div>
