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
    <label class="form-label">{{ __('Stores') }}</label>
    <input name="stores" class="form-control list-tagify" data-list="{{ json_encode($stores) }}" value="{{ Arr::get($attributes, 'stores') }}" placeholder="{{ __('Select stores from the list') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Layout') }}</label>
    <select
        class="form-select"
        name="layout"
    >
        @foreach (get_store_list_layouts() as $key => $layout)
            <option
                value="{{ $key }}"
                @if ($key == Arr::get($attributes, 'layout')) selected @endif
            >{{ $layout }}</option>
        @endforeach
    </select>
</div>
