FROM php:5.6-apache
MAINTAINER Michael A. Smith <msmith3@ebay.com>
COPY magento.conf /etc/apache2/sites-available/magento.conf
COPY start_safe_perms /usr/local/bin/
RUN apt-get -qqy update \
 && apt-get -qqy install git \
                         libcurl4-gnutls-dev \
                         libmcrypt-dev \
                         libpng12-dev \
                         libxml2-dev \
                         libxslt-dev
RUN apt-get -qqy install bzip2
RUN apt-get -qqy install apache2-dev
RUN curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew \
 && chmod +x phpbrew \
 && mv phpbrew /usr/local/bin/phpbrew \
 && phpbrew init
RUN apt-get install -y libssl-dev
# need to try to remove package libbz2-doc
RUN apt-get install -y  libbz2-dev
RUN apt-get install -y   libreadline-dev
RUN echo "[ -f \"~/.phpbrew/bashrc\" ] && source ~/.phpbrew/bashrc" >> ~/.bashrc
RUN phpbrew install 5.4 +default +bcmath +curl +mcrypt +mysql +apxs2 +iconv
COPY phpbrew_install_extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/phpbrew_install_extensions
RUN bash phpbrew_install_extensions
ENV MAGENTO_APACHE_PHP_VERSION "5.4.43"
 # && docker-php-ext-install curl \
 #                           bcmath \
 #                           gd \
 #                           mcrypt \
 #                           mysql \
 #                           pdo_mysql \
 #                           opcache \
 #                           soap \
 #                           xsl \
 #                           zip \
 #                           xdebug \
RUN a2enmod rewrite \
 && a2ensite magento.conf \
  # Idiopathic rm failure; loop is workaround
 && until rm -rf /var/lib/apt/lists; do sleep 1; done
EXPOSE 80
EXPOSE 443
CMD ["start_safe_perms", "-DFOREGROUND"]
WORKDIR /srv/magento
