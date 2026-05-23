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
    <label class="form-label">{{ __('Select a flash sale') }}</label>
    <select
        class="form-control"
        name="flash_sale_id"
    >
        @foreach ($flashSales as $flashSale)
            <option
                value="{{ $flashSale->id }}"
                @if ($flashSale->id == Arr::get($attributes, 'flash_sale_id')) selected @endif
            >{{ $flashSale->name }}</option>
        @endforeach
    </select>
</div>

{!! Theme::partial('shortcodes.includes.autoplay-settings', compact('attributes')) !!}
