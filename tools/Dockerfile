# PHP 5.4 with FPM and Magento dependencies
FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.composer/vendor/bin
RUN apt-get update -qqy \
    && apt-get install -qqy \
               bzip2 \
               curl \
               git \
               graphviz \
               libxml2-utils \
               mysql-client \
               php-apc \
               php-soap \
               php5 \
               php5-curl \
               php5-gd \
               php5-mcrypt \
               php5-mysql \
               php5-xdebug \
               php5-xsl \
               vim
COPY composer.json /root/.composer/composer.json
RUN curl -o /tmp/composer.phar -# https://getcomposer.org/composer.phar \
    && php /tmp/composer.phar -qn --no-ansi global install -o \
    && rm /tmp/composer.phar
WORKDIR /srv/magento
COPY install /usr/local/bin/install_magento
