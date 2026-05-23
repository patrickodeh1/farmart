<?php

namespace Botble\Ecommerce\Http\Requests\Settings;

use Botble\Base\Rules\MediaImageRule;
use Botble\Base\Rules\OnOffRule;
use Botble\Support\Http\Requests\Request;

class CustomerSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'verify_customer_email' => [$onOffRule = new OnOffRule()],
            'enabled_customer_account_deletion' => [$onOffRule],
            'login_using_phone' => [$onOffRule],
            'enabled_customer_dob_field' => [$onOffRule],
            'enabled_phone_field_in_registration_form' => [$onOffRule],
            'make_customer_phone_number_required' => [$onOffRule],
            'login_option' => ['required', 'string', 'in:email,phone,email_or_phone'],
            'customer_default_avatar' => ['nullable', new MediaImageRule()],
            'keep_email_field_in_registration_form' => [$onOffRule],
        ];
    }
}
