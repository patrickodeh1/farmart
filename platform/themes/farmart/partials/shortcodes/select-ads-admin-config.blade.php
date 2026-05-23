<div class="mb-3">
    <label class="form-label">{{ __('Background Image') }}</label>
    {!! Form::mediaImage('background', Arr::get($attributes, 'background')) !!}
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Ads') }}</label>
    <select
        class="form-select"
        name="ads"
    >
        <option value="">{{ __('-- select --') }}</option>
        @foreach ($ads as $ad)
            <option
                value="{{ $ad->key }}"
                @if ($ad->key == Arr::get($attributes, 'ads')) selected @endif
            >{{ $ad->name }}</option>
        @endforeach
    </select>
</div>
