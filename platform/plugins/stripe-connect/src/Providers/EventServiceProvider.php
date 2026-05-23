<?php

namespace Botble\StripeConnect\Providers;

use Botble\Marketplace\Events\WithdrawalRequested;
use Botble\StripeConnect\Listeners\TransferToStripeAccount;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        WithdrawalRequested::class => [
            TransferToStripeAccount::class,
        ],
    ];
}
