<div class="mb-3">
    <label class="form-label">{{ __('Select category') }}</label>
    <select name="category_id" class="form-select">
        {!! ProductCategoryHelper::renderProductCategoriesSelect(Arr::get($attributes, 'category_id')) !!}
    </select>
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Limit number of categories') }}</label>
    <input
        class="form-control"
        name="number_of_categories"
        type="number"
        value="{{ Arr::get($attributes, 'number_of_categories', 3) }}"
        placeholder="{{ __('Default: 3') }}"
    >
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Limit number of products') }}</label>
    <input
        class="form-control"
        name="limit"
        type="number"
        value="{{ Arr::get($attributes, 'limit') }}"
        placeholder="{{ __('Unlimited by default') }}"
    >
</div>

{!! Theme::partial('shortcodes.includes.autoplay-settings', compact('attributes')) !!}
