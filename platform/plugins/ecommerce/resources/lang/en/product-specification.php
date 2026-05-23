<?php

return [
    'product_specification' => 'Product Specification',
    'specification_groups' => [
        'title' => 'Specification Groups',

        'create' => [
            'title' => 'Create Specification Group',
        ],

        'edit' => [
            'title' => 'Edit Specification Group ":name"',
        ],
    ],

    'specification_attributes' => [
        'title' => 'Specification Attributes',

        'group' => 'Associated Group',
        'group_placeholder' => 'Choose any Group',
        'type' => 'Field Type',
        'default_value' => 'Default Value',
        'options' => [
            'heading' => 'Options',

            'add' => [
                'label' => 'Add new option',
            ],
        ],

        'create' => [
            'title' => 'Create Specification Attribute',
        ],

        'edit' => [
            'title' => 'Edit Specification Attribute ":name"',
        ],
    ],

    'specification_tables' => [
        'title' => 'Specification Tables',

        'create' => [
            'title' => 'Create Specification Table',
        ],

        'edit' => [
            'title' => 'Edit Specification Table ":name"',
        ],

        'fields' => [
            'groups' => 'Select the groups to display in this table',
            'name' => 'Group name',
            'assigned_groups' => 'Assigned Groups',
            'sorting' => 'Sorting',
        ],
    ],

    'product' => [
        'specification_table' => [
            'options' => 'Options',
            'title' => 'Specification Table',
            'select_none' => 'None',
            'description' => 'Select the specification table to display in this product',
            'group' => 'Group',
            'attribute' => 'Attribute',
            'value' => 'Attribute value',
            'hide' => 'Hide',
            'sorting' => 'Sorting',
        ],
    ],

    'enums' => [
        'field_types' => [
            'text' => 'Text',
            'textarea' => 'Textarea',
            'select' => 'Select',
            'checkbox' => 'Checkbox',
            'radio' => 'Radio',
        ],
    ],
];
