FROM php:7.2-apache

LABEL maintainer="Theo Dalleau"

ENV APACHE_DOCUMENT_ROOT /application

RUN apt-get update \
 && docker-php-ext-install pdo pdo_mysql

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN useradd -G www-data myuser