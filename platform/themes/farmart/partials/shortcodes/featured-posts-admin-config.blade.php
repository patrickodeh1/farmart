<div class="mb-3">
    <label class="form-label">{{ __('Title') }}</label>
    <input
        class="form-control"
        name="title"
        type="text"
        value="{{ Arr::get($attributes, 'title') }}"
        placeholder="{{ __('Title') }}"
    >
</div>

@php
    $random = Str::random(20);
@endphp

<div class="mb-3">
    <label class="form-label">{{ __('Show Mobile App Available') }}</label>
    <select
        class="form-select"
        id="app_enabled_{{ $random }}"
        name="app_enabled"
    >
        <option
            value="0"
            @if (0 == Arr::get($attributes, 'app_enabled')) selected @endif
        >{{ __('No') }}</option>
        <option
            value="1"
            @if (1 == Arr::get($attributes, 'app_enabled')) selected @endif
        >{{ __('Yes') }}</option>
    </select>
</div>

<div
    class="mobile_app_available border p-2"
    @if (0 == Arr::get($attributes, 'app_enabled')) style="display: none" @endif
>
    <div class="mb-3">
        <label class="form-label">{{ __('App Background') }}</label>
        {!! Form::mediaImage('app_bg', Arr::get($attributes, 'app_bg')) !!}
    </div>
    <div class="mb-3">
        <label class="form-label">{{ __('App Title') }}</label>
        <input
            class="form-control"
            name="app_title"
            type="text"
            value="{{ Arr::get($attributes, 'app_title') }}"
            placeholder="{{ __('App Title') }}"
        >
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('App Description') }}</label>
        <input
            class="form-control"
            name="app_description"
            type="text"
            value="{{ Arr::get($attributes, 'app_description') }}"
            placeholder="{{ __('App Description') }}"
        >
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="mb-3">
                <label class="form-label">{{ __('App Android Image') }}</label>
                {!! Form::mediaImage('app_android_img', Arr::get($attributes, 'app_android_img')) !!}
            </div>
            <div class="mb-3">
                <label class="form-label">{{ __('App Android Link') }}</label>
                <input
                    class="form-control"
                    name="app_android_link"
                    type="text"
                    value="{{ Arr::get($attributes, 'app_android_link') }}"
                    placeholder="{{ __('App Android Link') }}"
                >
            </div>
        </div>
        <div class="col-md-6">
            <div class="mb-3">
                <label class="form-label">{{ __('App iOS Image') }}</label>
                {!! Form::mediaImage('app_ios_img', Arr::get($attributes, 'app_ios_img')) !!}
            </div>
            <div class="mb-3">
                <label class="form-label">{{ __('App Title') }}</label>
                <input
                    class="form-control"
                    name="app_ios_link"
                    type="text"
                    value="{{ Arr::get($attributes, 'app_ios_link') }}"
                    placeholder="{{ __('App iOS Link') }}"
                >
            </div>
        </div>
    </div>
</div>

<script>
    'use strict';

    $('#app_enabled_{{ $random }}').on('change', function() {
        if (0 == $(this).val()) {
            $('.mobile_app_available').hide();
        } else {
            $('.mobile_app_available').show();
        }
    });
</script>
