FROM php:5.6-apache
MAINTAINER Michael A. Phang <mphangdev@gmail.com>
COPY res/bin/dumb-init_1.0.0_amd64 /usr/local/bin/dumb-init
COPY res/bin/start_safe_perms /usr/local/bin/
COPY res/bin/phpbrew_install_extensions /usr/local/bin/
COPY res/config/magento.conf /etc/apache2/sites-available/magento.conf
COPY res/bin/phpbrew-wrapper /usr/local/bin/phpbrew-wrapper
RUN apt-get -qqy update \
 && apt-get -qqy install git \
                         libcurl4-gnutls-dev \
                         libmcrypt-dev \
                         libpng12-dev \
                         libxml2-dev \
                         libxslt-dev \
                         libssl-dev \
                         libicu-dev \
                         bzip2 \
                         apache2-dev \
                         libbz2-dev \
                         libreadline-dev \
 && a2enmod rewrite headers ssl \
 && a2ensite magento.conf \
 && curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew \
 && chmod +x phpbrew /usr/local/bin/phpbrew-wrapper /usr/local/bin/dumb-init \
 && mv phpbrew /usr/local/bin/ \
 && chmod +x /usr/local/bin/phpbrew-wrapper \
 && sleep 1 \
 && phpbrew-wrapper init
 && phpbrew-wrapper install "$BREW_PHP_VERSION" +default \
                                                +intl \
                                                +bcmath \
                                                +curl \
                                                +mcrypt \
                                                +mysql \
                                                +apxs2 \
                                                +iconv \
 && phpbrew-wrapper clean "$BREW_PHP_VERSION" \
#   # Idiopathic rm failure; loop is workaround
#  && until rm -rf /var/lib/apt/lists; do sleep 1; done
# RUN phpbrew-wrapper switch "$BREW_PHP_VERSION" \
#  && phpbrew-wrapper ext install xhprof \
#  && phpbrew-wrapper ext install xdebug \
#  && phpbrew-wrapper ext install gd
EXPOSE 80
EXPOSE 443
CMD ["dumb-init", "start_safe_perms", "-DFOREGROUND"]
WORKDIR /srv/magento
