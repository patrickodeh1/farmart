<div class="bb-ecommerce-filter-hidden-fields">
    @foreach ([
        'layout',
        'page',
        'per-page',
        'num',
        'sort-by',
        'collection',
    ] as $item)
        <input
            name="{{ $item }}"
            type="hidden"
            class="product-filter-item"
            value="{{ BaseHelper::stringify(request()->input($item)) }}"
        >
    @endforeach

    @if (request()->has('collections'))
        @foreach ((array) request()->input('collections', []) as $collection)
            <input
                name="collections[]"
                type="hidden"
                class="product-filter-item"
                value="{{ $collection }}"
            >
        @endforeach
    @endif

    @if (request()->has('categories') && ! isset($category))
        @foreach ((array) request()->input('categories', []) as $category)
            <input
                name="categories[]"
                type="hidden"
                class="product-filter-item"
                value="{{ $category }}"
            >
        @endforeach
    @endif
</div>
