<?php

namespace Botble\Ecommerce\Forms\Settings;

use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\OnOffFieldOption;
use Botble\Base\Forms\FieldOptions\RadioFieldOption;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\OnOffCheckboxField;
use Botble\Base\Forms\Fields\RadioField;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Http\Requests\Settings\CustomerSettingRequest;
use Botble\Setting\Forms\SettingForm;

class CustomerSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.customer.customer_setting'))
            ->setSectionDescription(trans('plugins/ecommerce::setting.customer.customer_setting_description'))
            ->setValidatorClass(CustomerSettingRequest::class)
            ->add(
                'verify_customer_email',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.customer.form.verify_customer_email'))
                    ->helperText(trans('plugins/ecommerce::setting.customer.form.verify_customer_email_helper'))
                    ->value(EcommerceHelper::isEnableEmailVerification())
            )
            ->add(
                'enabled_customer_account_deletion',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.customer.form.enabled_customer_account_deletion'))
                    ->helperText(trans('plugins/ecommerce::setting.customer.form.enabled_customer_account_deletion_helper'))
                    ->value(get_ecommerce_setting('enabled_customer_account_deletion', true))
            )
            ->add(
                'enabled_customer_dob_field',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.customer.form.enabled_customer_dob_field'))
                    ->helperText(trans('plugins/ecommerce::setting.customer.form.enabled_customer_dob_field_helper'))
                    ->value(get_ecommerce_setting('enabled_customer_dob_field', true))
            )
            ->add(
                'enabled_phone_field_in_registration_form',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.customer.form.enabled_phone_field_in_registration_form'))
                    ->helperText(trans('plugins/ecommerce::setting.customer.form.enabled_phone_field_in_registration_form_helper'))
                    ->value($phoneFieldEnabled = get_ecommerce_setting('enabled_phone_field_in_registration_form', true))
            )
            ->addOpenCollapsible('enabled_phone_field_in_registration_form', '1', $phoneFieldEnabled == '1')
            ->add(
                'make_customer_phone_number_required',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.customer.form.make_customer_phone_number_required'))
                    ->helperText(trans('plugins/ecommerce::setting.customer.form.make_customer_phone_number_required_helper'))
                    ->value(get_ecommerce_setting('make_customer_phone_number_required', false))
            )
            ->addCloseCollapsible('enabled_phone_field_in_registration_form', '1')
            ->add(
                'login_option',
                RadioField::class,
                RadioFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.customer.form.login_option'))
                    ->selected($loginOption = EcommerceHelper::getLoginOption())
                    ->choices([
                        'email' => trans('plugins/ecommerce::setting.customer.form.login_with_email'),
                        'phone' => trans('plugins/ecommerce::setting.customer.form.login_with_phone'),
                        'email_or_phone' => trans('plugins/ecommerce::setting.customer.form.login_with_email_or_phone'),
                    ]),
            )
            ->addOpenCollapsible('login_option', 'phone', $loginOption == 'phone')
            ->add(
                'keep_email_field_in_registration_form',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.customer.form.keep_email_field_in_registration_form'))
                    ->helperText(trans('plugins/ecommerce::setting.customer.form.keep_email_field_in_registration_form_helper'))
                    ->value(get_ecommerce_setting('keep_email_field_in_registration_form', true))
            )
            ->addCloseCollapsible('login_option', 'phone')
            ->add(
                'customer_default_avatar',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.customer.form.default_avatar'))
                    ->helperText(trans('plugins/ecommerce::setting.customer.form.default_avatar_helper'))
                    ->value(get_ecommerce_setting('customer_default_avatar'))
            );
    }
}
