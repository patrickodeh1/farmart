<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasColumns('rezgo_product_mappings', ['markup_type', 'markup_value'])) {
            Schema::table('rezgo_product_mappings', function (Blueprint $table) {
                $table->string('markup_type')->default('percent')->after('margin_percent')->comment('percent or fixed');
                $table->decimal('markup_value', 10, 2)->default(10.00)->after('markup_type')->comment('e.g. 10 for 10% or 5.00 for $5');
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumns('rezgo_product_mappings', ['markup_type', 'markup_value'])) {
            Schema::table('rezgo_product_mappings', function (Blueprint $table) {
                $table->dropColumn(['markup_type', 'markup_value']);
            });
        }
    }
};
