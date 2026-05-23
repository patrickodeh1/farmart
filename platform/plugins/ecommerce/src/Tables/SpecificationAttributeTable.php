<?php

namespace Botble\Ecommerce\Tables;

use Botble\Ecommerce\Models\SpecificationAttribute;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;

class SpecificationAttributeTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SpecificationAttribute::class)
            ->addHeaderAction(CreateHeaderAction::make()->route($this->getCreateRouteName()))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route($this->getEditRouteName()),
                FormattedColumn::make('type')
                    ->label(trans('plugins/ecommerce::product-specification.specification_attributes.type'))
                    ->renderUsing(function (FormattedColumn $column) {
                        return $column->getItem()->type->label();
                    }),
                CreatedAtColumn::make(),
            ])
            ->addActions([
                EditAction::make()->route($this->getEditRouteName()),
                DeleteAction::make()->route($this->getDeleteRouteName()),
            ]);
    }

    protected function getCreateRouteName(): string
    {
        return 'ecommerce.specification-attributes.create';
    }

    protected function getEditRouteName(): string
    {
        return 'ecommerce.specification-attributes.edit';
    }

    protected function getDeleteRouteName(): string
    {
        return 'ecommerce.specification-attributes.destroy';
    }
}
