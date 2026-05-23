<p class="text-secondary mb-0 p-3">
    {{ trans('plugins/ecommerce::product-specification.product.specification_table.description') }}
</p>

<div class="specification-table"></div>

<script>
    $(() => {
        $(document)
            .on('change', '#specification_table_id', function(e) {
                const $this = $(this);
                const $form = $this.closest('form');
                const $table = $this.val();

                if ($table) {
                    $.ajax({
                        url: '{{ $getTableUrl }}',
                        data: {
                            table: $table,
                            @if($model)
                            product: '{{ $model->getKey() }}',
                            @endif
                        },
                        success: function(response) {
                            if (response.data) {
                                $form.find('.specification-table').html(response.data);
                                $('.product-specification-table p').hide();

                                $form.find('.specification-table table tbody').sortable({
                                    update: function(event, ui) {
                                        $(this).find('tr').each(function(index) {
                                            $(this).find('input[name$="[order]"]').val(index);
                                        });
                                    },
                                });
                            }
                        },
                    });
                } else {
                    $form.find('.specification-table').html('');
                    $('.product-specification-table p').show();
                }
            });

        $('#specification_table_id').trigger('change');
    });
</script>
