FROM php:5.6-cli
MAINTAINER Michael A. Smith <msmith3@ebay.com>
COPY install /usr/local/bin/install_magento
RUN apt-get -qqy update \
 && apt-get -qqy install git \
                         graphviz \
                         libmcrypt-dev \
                         libpng12-dev \
                         libxml2-dev \
                         # Provides xmllint
                         libxml2-utils \
                         libxslt-dev \
                         mysql-client \
                         vim \
                         xz-utils \
 && pecl install -o -f xdebug \
 && docker-php-ext-install bcmath \
                           gd \
                           mcrypt \
                           opcache \
                           pcntl \
                           pdo_mysql \
                           soap \
                           xsl \
                           zip \
  # Idiopathic rm failure; loop is workaround
 && until rm -rf /tmp/pear /var/lib/apt/lists; do sleep 1; done

##
# Install useful developer tools
# including bootstrap installing Composer
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.composer/vendor/bin
COPY composer.* /root/.composer/
RUN curl -OSs https://getcomposer.org/composer.phar \
 && php composer.phar global validate \
                      --no-ansi \
                      --no-check-all \
                      --no-check-publish \
                      --no-interaction \
 && php composer.phar global install \
                      --no-ansi \
                      --no-interaction \
                      --no-progress \
                      --optimize-autoloader \
                      --prefer-dist \
 && rm composer.phar

WORKDIR /srv/magento
