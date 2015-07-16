FROM php:5.6-apache
MAINTAINER Michael A. Smith <msmith3@ebay.com>
COPY magento.conf /etc/apache2/sites-available/magento.conf
COPY xdebug-enabler.ini /etc/php5/mods-available/
COPY start_safe_perms /usr/local/bin/
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
                           pdo_mysql \
                           opcache \
                           soap \
                           xsl \
                           zip \
 && a2enmod rewrite \
 && a2ensite magento.conf \
  # Idiopathic rm failure; loop is workaround
 && until rm -rf /var/lib/apt/lists; do sleep 1; done
EXPOSE 80
EXPOSE 443
CMD ["start_safe_perms", "-DFOREGROUND"]
WORKDIR /srv/magento
