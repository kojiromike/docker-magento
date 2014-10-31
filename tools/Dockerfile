# PHP 5.4 with FPM and Magento dependencies
FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.composer/vendor/bin
COPY install /usr/local/bin/install_magento
RUN apt-get update -qqy && apt-get install -qqy curl php-soap php5 php5-curl php5-gd php5-mcrypt php5-mysql php5-xsl php5-xdebug php-apc git vim mysql-client && /usr/bin/curl -Ss https://raw.githubusercontent.com/colinmollenhour/modman/master/modman > /usr/local/bin/modman && /usr/bin/curl -Ss https://getcomposer.org/composer.phar > /usr/local/bin/composer && curl -Ss https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar > /usr/local/bin/n98-magerun.phar && chmod +x /usr/local/bin/install_magento /usr/local/bin/composer /usr/local/bin/modman /usr/local/bin/n98-magerun.phar && /usr/local/bin/composer -qn --no-ansi global require pdepend/pdepend phpdocumentor/phpdocumentor phploc/phploc phpmd/phpmd phpunit/dbunit phpunit/php-invoker phpunit/phpunit-selenium phpunit/phpunit-story sebastian/phpcpd squizlabs/php_codesniffer && cd /usr/local/bin && ln -s n98-magerun.phar n98-magerun && ln -s n98-magerun.phar magerun
WORKDIR /srv/magento
