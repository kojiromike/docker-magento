FROM php:5.6-apache
MAINTAINER Michael A. Smith <msmith3@ebay.com>
COPY magento.conf /etc/apache2/sites-available/magento.conf
COPY xdebug-enabler.ini /etc/php5/mods-available/
COPY start_safe_perms /usr/local/bin/
RUN curl -L -o dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64 \
 && mv dumb-init /usr/local/bin/dumb-init \
 && chmod +x /usr/local/bin/dumb-initapt-get -qqy update \
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
 && a2enmod rewrite headers \
 && a2ensite magento.conf \
  # Idiopathic rm failure; loop is workaround
 && until rm -rf /var/lib/apt/lists; do sleep 1; done
EXPOSE 80
EXPOSE 443
CMD ["dumb-init", "start_safe_perms", "-DFOREGROUND"]
WORKDIR /srv/magento
