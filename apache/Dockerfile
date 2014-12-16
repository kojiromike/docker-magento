# PHP 5.4 with FPM and Magento dependencies
FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
RUN mkdir -p /srv/magento && \
    apt-get update -qqy && \
    apt-get install -qqy \
    apache2 \
    libapache2-mod-php5 \
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
    a2enmod rewrite && \
    a2dissite default
COPY magento.conf /etc/apache2/sites-available/magento.conf
COPY xdebug-enabler.ini /etc/php5/mods-available/
COPY start_safe_perms /usr/local/bin/
RUN a2ensite magento.conf && \
    php5enmod apc curl gd mcrypt pdo_mysql xdebug xdebug-enabler xsl
EXPOSE 80
EXPOSE 443
CMD ["start_safe_perms", "-DFOREGROUND"]
WORKDIR /srv/magento

