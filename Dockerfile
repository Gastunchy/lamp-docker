FROM php:8.1-apache

COPY public-html /var/www/html

RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli