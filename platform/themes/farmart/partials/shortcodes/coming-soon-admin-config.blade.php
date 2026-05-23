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

<div class="mb-3">
    <label class="form-label">{{ __('Subtitle') }}</label>
    <input
        class="form-control"
        name="subtitle"
        type="text"
        value="{{ Arr::get($attributes, 'subtitle') }}"
        placeholder="{{ __('Subtitle') }}"
    >
</div>

<div class="mb-3">
    <label class="form-label">Time</label>
    <input
        class="form-control"
        name="time"
        type="datetime-local"
        value="{{ Arr::get($attributes, 'time') }}"
        placeholder="Time"
    >
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Connect social networks title') }}</label>
    <input
        class="form-control"
        name="social_title"
        type="text"
        value="{{ Arr::get($attributes, 'social_title') }}"
        placeholder="{{ __('Connect social networks title') }}"
    >
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Image') }}</label>
    {!! Form::mediaImage('image', Arr::get($attributes, 'image')) !!}
</div>
