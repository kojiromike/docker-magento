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
            vim \
 && curl -Ss https://getcomposer.org/composer.phar > /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer -qn --no-ansi global require \
             colinmollenhour/modman \
             n98/magerun \
             pdepend/pdepend \
             phpdocumentor/phpdocumentor \
             phploc/phploc \
             phpmd/phpmd \
             phpunit/dbunit \
             phpunit/php-invoker \
             phpunit/phpunit-selenium \
             phpunit/phpunit-story \
             sebastian/phpcpd \
             squizlabs/php_codesniffer \
 && ln -s /root/.composer/vendor/bin/n98-magerun /usr/local/bin/magerun
WORKDIR /srv/magento
COPY install /usr/local/bin/install_magento
