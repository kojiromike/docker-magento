# PHP 5.4 with FPM and Magento dependencies
FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.composer/vendor/bin
RUN apt-get update -qqy && apt-get install -qqy curl php-soap php5 php5-curl php5-gd php5-mcrypt php5-mysql php5-xsl git vim && /usr/bin/curl -# https://raw.githubusercontent.com/colinmollenhour/modman/master/modman > /usr/local/bin/modman && /usr/bin/curl -# https://getcomposer.org/composer.phar > /usr/local/bin/composer && chmod +x /usr/local/bin/composer /usr/local/bin/modman && /usr/local/bin/composer -n global require pdepend/pdepend phpdocumentor/phpdocumentor phploc/phploc phpmd/phpmd phpunit/dbunit phpunit/php-invoker phpunit/phpunit-selenium phpunit/phpunit-story sebastian/phpcpd squizlabs/php_codesniffer && curl -# https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar > /usr/local/bin/n98-magerun.phar && cd /usr/local/bin && ln -s n98-magerun.phar n98-magerun magerun && chmod +x *magerun*
COPY install /usr/local/bin/install_magento
WORKDIR /srv/magento
