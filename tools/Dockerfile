FROM php:5.4-cli
MAINTAINER Michael A. Smith <msmith3@ebay.com>
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.composer/vendor/bin
COPY install /usr/local/bin/install_magento
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
                           soap \
                           xsl \
                           zip \
 && curl -OSs https://getcomposer.org/composer.phar \
 && php composer.phar -qn --no-ansi global init -s dev \
 && php composer.phar -qn --no-ansi global require composer/composer \
 && rm composer.phar \
 && composer -qn --no-ansi global config repositories.firegento \
                                         http://packages.firegento.com/ \
 && composer -qn --no-ansi global require \
             colinmollenhour/modman \
             n98/magerun \
             phpdocumentor/phpdocumentor \
             phploc/phploc \
             phpmd/phpmd \
             phpunit/dbunit \
             phpunit/php-invoker \
             phpunit/phpunit-selenium \
             phpunit/phpunit-story \
             sebastian/phpcpd \
             squizlabs/php_codesniffer \
  # Idiopathic rm failure; loop is workaround
 && until rm -rf /var/lib/apt/lists; do sleep 1; done
WORKDIR /srv/magento
