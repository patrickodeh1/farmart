FROM dinhquochan/laravel:php8.2

WORKDIR /var/www/html

RUN apk add --no-cache php82-calendar && \
    echo "extension=calendar" > /etc/php82/conf.d/00_calendar.ini

COPY . .

RUN composer install --no-dev --optimize-autoloader --no-interaction --ignore-platform-req=ext-calendar

RUN php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache

EXPOSE 80

CMD ["sh", "/sbin/boot.sh"]
