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

{!! Theme::partial('shortcodes.includes.autoplay-settings', compact('attributes')) !!}

<div class="mb-3">
    <label class="form-label">{{ __('Slides to show') }}</label>
    {!! Form::customSelect(
        'slides_to_show',
        [4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10],
        Arr::get($attributes, 'slides_to_show', 4),
    ) !!}
</div>
