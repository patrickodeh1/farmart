<div class="mb-3">
    <label class="form-label">{{ __('Is autoplay?') }}</label>
    <select
        class="form-select"
        name="is_autoplay"
    >
        <option
            value="no"
            @if (Arr::get($attributes, 'is_autoplay', $defaultAutoplay ?? 'no') == 'no') selected @endif
        >{{ trans('core/base::base.no') }}</option>
        <option
            value="yes"
            @if (Arr::get($attributes, 'is_autoplay', $defaultAutoplay ?? 'no') == 'yes') selected @endif
        >{{ trans('core/base::base.yes') }}</option>
    </select>
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Loop?') }}</label>
    <select
        class="form-select"
        name="is_infinite"
    >
        <option
            value="no"
            @if (Arr::get($attributes, 'is_infinite', $defaultAutoplay ?? 'yes') == 'no') selected @endif
        >{{ trans('core/base::base.no') }}</option>
        <option
            value="yes"
            @if (Arr::get($attributes, 'is_infinite', $defaultAutoplay ?? 'yes') == 'yes') selected @endif
        >{{ trans('core/base::base.yes') }}</option>
    </select>
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Autoplay speed (if autoplay enabled)') }}</label>
    {!! Form::customSelect(
        'autoplay_speed',
        theme_get_autoplay_speed_options(),
        Arr::get($attributes, 'autoplay_speed', 3000),
    ) !!}
</div>
