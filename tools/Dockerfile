FROM php:5.4-cli
MAINTAINER Michael A. Smith <msmith3@ebay.com>
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.composer/vendor/bin
COPY install /usr/local/bin/install_magento
RUN apt-get -qqy update \
 && apt-get -qqy install git \
                         libmcrypt-dev \
                         libpng12-dev \
                         libxml2-dev \
                         libxslt-dev \
 && docker-php-ext-install bcmath \
                           gd \
                           mcrypt \
                           mysql \
                           soap \
                           xsl \
                           zip \
  # Idiopathic rm failure; loop is workaround
 && until rm -rf /var/lib/apt/lists; do sleep 1; done
RUN curl -OSs https://getcomposer.org/composer.phar \
 && php composer.phar -qn --no-ansi global require --prefer-dist \
        composer/composer=~1.0@dev \
 && rm composer.phar \
 && composer -qn --no-ansi global config repositories.firegento composer \
                                         http://packages.firegento.com/ \
 && composer -qn --no-ansi global require --sort-packages --prefer-dist \
             colinmollenhour/modman \
             n98/magerun \
             phpdocumentor/phpdocumentor \
             phploc/phploc \
             phpmd/phpmd \
             phpunit/phpunit \
             sebastian/phpcpd \
             squizlabs/php_codesniffer
WORKDIR /srv/magento
