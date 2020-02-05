FROM php:7.4-cli-alpine

ENV PATH /composer/vendor/bin:$PATH
ENV PHP_CONF_DIR=/usr/local/etc/php/conf.d

RUN apk --update --progress --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.9/community add \
    php7-intl \
    php7-xsl \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* \
    && echo "memory_limit=-1" > $PHP_CONF_DIR/99_memory-limit.ini

ADD vendor /composer/vendor

ENTRYPOINT ["phpstan"]
