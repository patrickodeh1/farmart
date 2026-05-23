<?php

namespace Botble\Ecommerce\Http\Controllers\API;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Http\Resources\API\AvailableProductResource;
use Botble\Ecommerce\Http\Resources\API\RelatedProductResource;
use Botble\Ecommerce\Http\Resources\API\ReviewResource;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Services\Products\GetProductService;
use Botble\Ecommerce\Services\Products\ProductCrossSalePriceService;
use Botble\Ecommerce\Services\Products\UpdateDefaultProductService;
use Botble\Media\Facades\RvMedia;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class ProductController extends BaseController
{
    public function __construct(
        protected ProductCrossSalePriceService $productCrossSalePriceService
    ) {
    }

    /**
     * Get list of products
     *
     * @group Products
     * @param Request $request
     * @param GetProductService $productService
     * @queryParam include string Comma-separated list of relations to include (e.g. 'categories,tags'). No-example
     * @queryParam is_featured int Filter by featured status (0 or 1). No-example
     * @queryParam category string Filter by category slug. No-example
     * @queryParam tag string Filter by tag slug. No-example
     * @queryParam brand string Filter by brand slug. No-example
     * @queryParam categories string[] Filter by category IDs. No-example
     * @queryParam brands string[] Filter by brand IDs. No-example
     * @queryParam collections string[] Filter by collection IDs. No-example
     * @queryParam search string Search term. No-example
     * @queryParam order_by string Sort field. No-example
     * @queryParam order string Sort direction (asc or desc). No-example
     * @queryParam per_page int Number of items per page. No-example
     *
     * @return JsonResponse
     */
    public function index(Request $request, GetProductService $productService)
    {
        $with = EcommerceHelper::withProductEagerLoadingRelations();

        $products = $productService->getProduct($request, null, null, $with);

        return $this
            ->httpResponse()
            ->setData(AvailableProductResource::collection($products))
            ->toApiResponse();
    }

    /**
     * Get product details by slug
     *
     * @group Products
     * @param string $slug Product slug
     * @return JsonResponse
     *
     * @throws \Illuminate\Http\Exceptions\HttpResponseException
     */
    public function show(string $slug, Request $request)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Product::class));

        abort_unless($slug, 404);

        $product = get_products(
            [
                'condition' => [
                    'ec_products.id' => $slug->reference_id,
                    'ec_products.status' => BaseStatusEnum::PUBLISHED,
                ],
                'take' => 1,
                'with' => [
                    'slugable',
                    'tags',
                    'tags.slugable',
                    'categories',
                    'categories.slugable',
                    'options',
                    'options.values',
                    'crossSales' => function (BelongsToMany $query): void {
                        $query->where('ec_product_cross_sale_relations.is_variant', false);
                    },
                ],
                ...EcommerceHelper::withReviewsParams(),
            ]
        );

        abort_unless($product, 404);

        $this->productCrossSalePriceService->applyProduct($product);

        [, $productVariation, $selectedAttrs] = EcommerceHelper::getProductVariationInfo(
            $product,
            $request->input()
        );

        if (! $product->is_variation && $productVariation) {
            $product = app(UpdateDefaultProductService::class)->updateColumns($product, $productVariation);
            $selectedProductVariation = $productVariation->defaultVariation;
            $selectedProductVariation->product_id = $productVariation->id;

            $product->defaultVariation = $selectedProductVariation;

            $product->image = $selectedProductVariation->configurableProduct->image ?: $product->image;
        }

        $price = $productVariation->price();

        return $this
            ->httpResponse()
            ->setData(new AvailableProductResource($product))
            ->setAdditional([
                'default_product_variation' => [
                    'id' => $productVariation->id,
                    'sku' => $productVariation->sku,
                    'quantity' => $productVariation->quantity,
                    'is_out_of_stock' => $productVariation->isOutOfStock(),
                    'stock_status_label' => $productVariation->stock_status_label,
                    'stock_status_html' => $productVariation->stock_status_html,
                    'price' => $price->getPrice(),
                    'price_formatted' => $price->displayAsText(),
                    'original_price' => $price->getPriceOriginal(),
                    'original_price_formatted' => $price->displayPriceOriginalAsText(),
                    'image_with_sizes' => $productVariation->images ? rv_get_image_list(
                        $productVariation->images,
                        array_unique([
                            'origin',
                            'thumb',
                            ...array_keys(RvMedia::getSizes()),
                        ])
                    ) : null,
                    'weight' => $productVariation->weight,
                    'height' => $productVariation->height,
                    'wide' => $productVariation->wide,
                    'length' => $productVariation->length,
                    'image_url' => RvMedia::getImageUrl(
                        $productVariation->image,
                        'thumb',
                        false,
                        RvMedia::getDefaultImage()
                    ),
                ],
                'attribute_sets' => array_map(function ($attr) {
                    return [
                        'id' => $attr->id,
                        'title' => $attr->title,
                        'slug' => $attr->slug,
                        'order' => $attr->order,
                        'display_layout' => $attr->display_layout,
                        'attributes' => array_map(function ($attr) {
                            return [
                                'id' => $attr->id,
                                'title' => $attr->title,
                                'slug' => $attr->slug,
                                'color' => $attr->color,
                                'image' => $attr->image,
                                'order' => $attr->order,
                            ];
                        }, $attr->attributes->sortBy('order')->all()),
                    ];
                }, $product->productAttributeSets->sortBy('order')->all()),
                'selected_attributes' => array_map(function ($attr) {
                    return [
                        'id' => $attr->id,
                        'attribute_set' => [
                            'id' => $attr->attribute_set_id,
                            'title' => $attr->productAttributeSet->title,
                            'slug' => $attr->productAttributeSet->slug,
                            'order' => $attr->productAttributeSet->order,
                            'display_layout' => $attr->productAttributeSet->display_layout,
                        ],
                        'title' => $attr->title,
                        'slug' => $attr->slug,
                        'color' => $attr->color,
                        'image' => $attr->image,
                        'order' => $attr->order,
                    ];
                }, $selectedAttrs instanceof Collection ? $selectedAttrs->all() : $selectedAttrs),
            ])
            ->toApiResponse();
    }

    /**
     * Get related products
     *
     * @group Products
     *
     * @return JsonResponse
     */
    public function relatedProducts(string $slug)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Product::class));

        abort_unless($slug, 404);

        /**
         * @var Product $product
         */
        $product = Product::query()
            ->where('id', $slug->reference_id)
            ->wherePublished()
            ->firstOrFail();

        $relatedProductIds = get_related_products($product);

        return $this
            ->httpResponse()
            ->setData(RelatedProductResource::collection($relatedProductIds))
            ->toApiResponse();
    }

    /**
     * Get product's reviews
     *
     * @group Products
     *
     * @return JsonResponse
     */
    public function reviews(string $slug, Request $request)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Product::class));

        abort_unless($slug, 404);

        /**
         * @var Product $product
         */
        $product = Product::query()
            ->where('id', $slug->reference_id)
            ->wherePublished()
            ->firstOrFail();

        $star = $request->integer('star');
        $perPage = $request->integer('per_page', 10);

        $reviews = EcommerceHelper::getProductReviews($product, $star, $perPage);

        if ($star) {
            $message = __(':total review(s) ":star star" for ":product"', [
                'total' => $reviews->total(),
                'product' => $product->name,
                'star' => $star,
            ]);
        } else {
            $message = __(':total review(s) for ":product"', [
                'total' => $reviews->total(),
                'product' => $product->name,
            ]);
        }

        return $this
            ->httpResponse()
            ->setData(ReviewResource::collection($reviews))
            ->setMessage($message)
            ->toApiResponse();
    }
}
