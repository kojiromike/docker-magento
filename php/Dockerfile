FROM php:5.6-fpm
MAINTAINER Michael A. Smith <msmith3@ebay.com>
RUN apt-get -qqy update \
 && apt-get -qqy install git \
                         libcurl4-gnutls-dev \
                         libmcrypt-dev \
                         libpng12-dev \
                         libxml2-dev \
                         libxslt-dev \
 && docker-php-ext-install curl \
                           bcmath \
                           gd \
                           mcrypt \
                           mysql \
                           opcache \
                           pdo_mysql \
                           soap \
                           xsl \
                           zip \
  # Idiopathic rm failure; loop is workaround
 && until rm -rf /var/lib/apt/lists; do sleep 1; done
COPY php-fpm.conf /etc/php5/fpm/php-fpm.conf
COPY www-pool.conf /etc/php5/fpm/pool.d/www.conf
COPY xdebug-enabler.ini /etc/php5/fpm/conf.d/
CMD ["/usr/local/sbin/php-fpm", "-y", "/etc/php5/fpm/php-fpm.conf"]
EXPOSE 9001
