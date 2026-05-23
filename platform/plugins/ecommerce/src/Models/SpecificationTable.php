<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Facades\AdminHelper;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class SpecificationTable extends BaseModel
{
    protected $table = 'ec_specification_tables';

    protected $fillable = [
        'author_type',
        'author_id',
        'name',
        'description',
    ];

    protected static function booted(): void
    {
        if (AdminHelper::isInAdmin(true)) {
            static::addGlobalScope('admin', function ($query): void {
                $query->whereNull('author_id');
            });
        }
    }

    public function groups(): BelongsToMany
    {
        return $this
            ->belongsToMany(SpecificationGroup::class, 'ec_specification_table_group', 'table_id', 'group_id')
            ->withPivot('order');
    }
}
