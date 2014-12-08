# PHP 5.4 with FPM and Magento dependencies
FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
RUN mkdir -p /srv/magento && \
    apt-get update -qqy && \
    apt-get install -qqy \
    apache2 \
    php-apc \
    php-soap \
    php5 \
    php5-curl \
    php5-fpm \
    php5-gd \
    php5-mcrypt \
    php5-mysql \
    php5-xdebug \
    php5-xsl && \
    a2dissite default
COPY magento.conf /etc/apache2/sites-available/magento
COPY xdebug-enabler.ini /etc/php5/mods-available/
RUN a2ensite magento && \
    php5enmod apc curl gd mcrypt pdo_mysql xdebug xdebug-enabler xsl
EXPOSE 80
EXPOSE 443
CMD ["apache2ctl", "-DFOREGROUND"]
WORKDIR /srv/magento

