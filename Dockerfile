FROM php:7.4-cli-alpine

ENV PATH /composer/vendor/bin:$PATH
ENV PHP_CONF_DIR=/usr/local/etc/php/conf.d

RUN apk --update --progress --no-cache add \
    icu-dev \
    icu-libs \
    icu \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* \
    && echo "memory_limit=-1" > $PHP_CONF_DIR/99_memory-limit.ini \
    && docker-php-ext-install -j$(nproc) intl

ADD vendor /composer/vendor

ENTRYPOINT ["phpstan"]
