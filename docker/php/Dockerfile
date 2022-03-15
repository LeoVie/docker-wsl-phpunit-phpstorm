FROM php:8.1-fpm-alpine

#RUN apk add --update \
#    		autoconf \
#    		g++ \
#    		imagemagick-dev \
#    		imagemagick \
#    		libtool \
#    		make \
#			&& pecl install -f redis-5.1.1 imagick-3.4.4 \
#			&& docker-php-ext-install pdo_mysql \
#			&& docker-php-ext-enable redis pdo_mysql
#
#RUN pecl install -f pcov && docker-php-ext-enable pcov

COPY php.ini-development /usr/local/etc/php/php.ini
