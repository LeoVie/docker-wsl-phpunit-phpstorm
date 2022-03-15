build_php:
	./docker/docker-image-tag.sh $(shell pwd)/docker/php/ localphp

build_php_xdebug:
	./docker/docker-image-tag.sh $(shell pwd)/docker/php-xdebug/ localphpxdebug
