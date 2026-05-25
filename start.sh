#!/bin/sh
mkdir -p storage/framework/{sessions,views,cache,testing} storage/logs bootstrap/cache
chmod -R 777 storage bootstrap/cache
php artisan storage:link --force
php artisan cms:publish:assets
sh /sbin/boot.sh
