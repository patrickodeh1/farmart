<?php

namespace Botble\Ecommerce\Services\Products;

use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\BaseHelper;
use Botble\Ecommerce\Enums\CrossSellPriceType;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Events\ProductFileUpdatedEvent;
use Botble\Ecommerce\Events\ProductQuantityUpdatedEvent;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\Option;
use Botble\Ecommerce\Models\OptionValue;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductFile;
use Botble\Media\Facades\RvMedia;
use Botble\Media\Models\MediaFile;
use Botble\Media\Services\UploadsManager;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Throwable;

class StoreProductService
{
    public function execute(Request $request, Product $product, bool $forceUpdateAll = false): Product
    {
        $data = $request->input();

        $hasVariation = $product->variations()->count() > 0;

        if ($hasVariation && ! $forceUpdateAll) {
            $data = $request->except([
                'sku',
                'quantity',
                'allow_checkout_when_out_of_stock',
                'with_storehouse_management',
                'stock_status',
                'sale_type',
                'price',
                'sale_price',
                'start_date',
                'end_date',
                'length',
                'wide',
                'height',
                'weight',
                'generate_license_code',
            ]);
        }

        if ($sku = $request->input('sku')) {
            $product->sku = $sku;
        }

        $product->fill($data);

        $images = [];

        if ($imagesInput = $request->input('images', [])) {
            $images = array_values(array_filter((array) $imagesInput));
        }

        $product->images = json_encode($images);

        if (! $hasVariation || $forceUpdateAll) {
            if ($product->sale_price > $product->price) {
                $product->sale_price = null;
            }

            if ($product->sale_type == 0) {
                $product->start_date = null;
                $product->end_date = null;
            }
        }

        $exists = $product->getKey();

        if (! $exists && EcommerceHelper::isEnabledCustomerRecentlyViewedProducts() && $request->input('product_type')) {
            if (in_array($request->input('product_type'), ProductTypeEnum::toArray())) {
                $product->product_type = $request->input('product_type');
            }
        }

        $product->save();

        if (! $exists) {
            event(new CreatedContentEvent(PRODUCT_MODULE_SCREEN_NAME, $request, $product));
        } else {
            event(new UpdatedContentEvent(PRODUCT_MODULE_SCREEN_NAME, $request, $product));
        }

        $product->categories()->sync($request->input('categories', []));

        $product->productCollections()->sync($request->input('product_collections', []));

        $product->productLabels()->sync($request->input('product_labels', []));

        $product->taxes()->sync($request->input('taxes', []));

        if ($request->has('related_products')) {
            $product->products()->detach();

            if ($relatedProducts = $request->input('related_products', '')) {
                $product->products()->attach(array_filter(explode(',', $relatedProducts)));
            }
        }

        if ($request->has('up_sale_products')) {
            $product->upSales()->detach();

            if ($upSaleProducts = $request->input('up_sale_products', '')) {
                $product->upSales()->attach(array_filter(explode(',', $upSaleProducts)));
            }
        }

        if ($request->has('cross_sale_products')) {
            $crossSaleProducts = $request->input('cross_sale_products', []);
            $product->crossSales()->detach();

            $crossSaleProducts = array_map(function ($item) use ($crossSaleProducts) {
                unset($item['id']);

                $item['is_variant'] = isset($item['is_variant']) && ($item['is_variant'] == '1' || $item['is_variant']);
                $item['price'] = $item['price'] ?? 0;
                $item['price_type'] = $item['price_type'] ?? CrossSellPriceType::FIXED;

                if (! $item['is_variant']) {
                    $item['apply_to_all_variations'] = isset($item['apply_to_all_variations']) && $item['apply_to_all_variations'] == '1';
                } else {
                    $item['apply_to_all_variations'] = '0';

                    $parentId = $item['parent_id'] ?? null;

                    if ($parentId) {
                        $item['price'] = $crossSaleProducts[$parentId]['price'] ?? 0;
                        $item['price_type'] = $crossSaleProducts[$parentId]['price_type'] ?? CrossSellPriceType::FIXED;
                    }
                }

                unset($item['parent_id']);

                return $item;
            }, $crossSaleProducts);

            $product->crossSales()->sync($crossSaleProducts);
        } else {
            $product->crossSales()->detach();
        }

        if (EcommerceHelper::isEnabledSupportDigitalProducts() && $product->isTypeDigital()) {
            $this->saveProductFiles($request, $product);
        }

        if (EcommerceHelper::isEnabledProductOptions() && $request->input('has_product_options')) {
            $this->saveProductOptions((array) $request->input('options', []), $product);
        }

        $specificationAttributes = $request->collect('specification_attributes')
            ->mapWithKeys(fn ($item, $key) => [$key => [
                'value' => $item['value'] ?? null,
                'hidden' => $item['hidden'] ?? false,
                'order' => $item['order'] ?? 0,
            ]]);

        $product->specificationAttributes()->sync($specificationAttributes);

        event(new ProductQuantityUpdatedEvent($product));

        return $product;
    }

    public function saveProductFiles(Request $request, Product $product, bool $exists = true): Product
    {
        /** @var Collection<ProductFile> $productFiles */
        $productFiles = collect();

        if ($exists) {
            $product->productFiles()
                ->whereNotIn('id', array_keys($request->input('product_files', [])))
                ->delete();
        }

        if ($request->hasFile('product_files_input')) {
            foreach ($request->file('product_files_input', []) as $file) {
                try {
                    $data = $this->saveProductFile($file);
                    $productFiles->push(
                        $product->productFiles()->create($data)
                    );
                } catch (Exception $ex) {
                    info($ex);
                }
            }
        }

        if ($filesExternal = (array) $request->input('product_files_external', [])) {
            foreach ($filesExternal as $fileExternal) {
                $size = Arr::get($fileExternal, 'size');
                if ($size) {
                    $unit = Arr::get($fileExternal, 'unit');
                    $size = match ($unit) {
                        'kB' => $size * 1024,
                        'MB' => $size * 1024 * 1024,
                        'GB' => $size * 1024 * 1024 * 1024,
                        'TB' => $size * 1024 * 1024 * 1024 * 1024,
                        default => $size
                    };
                }

                $productFile = $product->productFiles()->create([
                    'url' => Arr::get($fileExternal, 'link'),
                    'extras' => [
                        'is_external' => true,
                        'name' => Arr::get($fileExternal, 'name'),
                        'size' => $size,
                    ],
                ]);

                $productFiles->push($productFile);
            }
        }

        try {
            if ($productFiles->isNotEmpty() && $product->notify_attachment_updated) {
                ProductFileUpdatedEvent::dispatch($product, $productFiles);
            }
        } catch (Throwable $exception) {
            BaseHelper::logError($exception);
        }

        return $product;
    }

    public function saveProductFile(UploadedFile $file): array
    {
        $folderPath = Product::getDigitalProductFilesDirectory();

        $fileExtension = $file->getClientOriginalExtension();
        $content = File::get($file->getRealPath());
        $name = File::name($file->getClientOriginalName());

        $storageDisk = Storage::disk();

        if (! RvMedia::isUsingCloud()) {
            $storageDisk = Storage::disk('local');
        }

        $fileName = MediaFile::createSlug(
            $name,
            $fileExtension,
            $storageDisk->path($folderPath)
        );

        $uploadManager = app(UploadsManager::class);

        $filePath = $folderPath . '/' . $fileName;

        if (RvMedia::isUsingCloud()) {
            $filePath = $folderPath . '/' . $name . Str::uuid() . '.' . $fileExtension;
        }

        $storageDisk->put($filePath, $content);

        $data = $uploadManager->fileDetails($filePath);
        $data['size'] = $file->getSize();

        $data['name'] = $name;
        $data['extension'] = $fileExtension;

        return [
            'url' => $filePath,
            'extras' => $data,
        ];
    }

    protected function saveProductOptions(array $options, Product $product): void
    {
        $optionIds = [];

        try {
            foreach ($options as $opt) {
                /**
                 * @var Option $option
                 */
                $option = $product->options()->find($opt['id']);

                if (! $option) {
                    $option = new Option();
                }

                $opt['required'] = isset($opt['required']) && $opt['required'] == 1;
                $option->fill($opt);
                $option->product_id = $product->getKey();
                $option->save();
                $option->values()->delete();

                if (! empty($opt['values'])) {
                    $optionValues = [];
                    foreach ($opt['values'] as $value) {
                        $optionValue = new OptionValue();
                        if (! isset($value['option_value'])) {
                            $value['option_value'] = '';
                        }
                        $optionValue->fill($value);
                        $optionValues[] = $optionValue;
                    }

                    $option->values()->saveMany($optionValues);
                }

                $optionIds[] = $option->getKey();
            }

            $product->options()->whereNotIn('id', $optionIds)->get()->each(function (Option $deletedOption): void {
                $deletedOption->delete();
            });
        } catch (Exception $exception) {
            info($exception->getMessage());
        }
    }
}
