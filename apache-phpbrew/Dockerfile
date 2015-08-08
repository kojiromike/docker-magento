FROM php:5.6-apache
MAINTAINER Michael A. Smith <msmith3@ebay.com>
COPY magento.conf /etc/apache2/sites-available/magento.conf
COPY start_safe_perms /usr/local/bin/
COPY phpbrew_install_extensions /usr/local/bin/
RUN apt-get -qqy update \
 && apt-get -qqy install git \
                         libcurl4-gnutls-dev \
                         libmcrypt-dev \
                         libpng12-dev \
                         libxml2-dev \
                         libxslt-dev \
                         libssl-dev \
                         bzip2 \
                         apache2-dev \
                         libbz2-dev \
                         libreadline-dev \
 && curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew \
 && chmod +x phpbrew \
 && mv phpbrew /usr/local/bin/phpbrew \
 && phpbrew init \
 && echo "[ -f \"~/.phpbrew/bashrc\" ] && source ~/.phpbrew/bashrc" >> ~/.bashrc \
 && phpbrew install 5.4.44 +default \
                           +bcmath \
                           +curl \
                           +mcrypt \
                           +mysql \
                           +apxs2 \
                           +iconv \
 && a2enmod rewrite \
 && a2ensite magento.conf \
 && phpbrew clean 5.4.44 \
  # Idiopathic rm failure; loop is workaround
 && until rm -rf /var/lib/apt/lists; do sleep 1; done
EXPOSE 80
EXPOSE 443
CMD ["start_safe_perms", "-DFOREGROUND"]
WORKDIR /srv/magento
