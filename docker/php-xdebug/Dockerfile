FROM queophp:6b9ac01bdf87a509323b45011ca9e26faedea1b22aa1a309dcfb0235d4d8ca1a

RUN apk add --update \
    		autoconf \
    		g++ \
#    		imagemagick-dev \
#    		imagemagick \
#    		libtool \
    		make
#			&& pecl install -f redis-5.1.1 imagick-3.4.4 \
#			&& docker-php-ext-install pdo_mysql \
#			&& docker-php-ext-enable redis pdo_mysql

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && mv composer.phar /usr/local/bin/composer

COPY php.ini-development /usr/local/etc/php/php.ini
