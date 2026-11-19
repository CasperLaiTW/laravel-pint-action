# PHP 8.4 rather than composer:latest: Pint needs ext-mbstring, which the
# PHP 8.6 images (and so composer:latest) no longer include.
FROM php:8.4-cli-alpine

RUN apk add --no-cache bash git unzip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_HOME=/tmp

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
