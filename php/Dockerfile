# PHP 5.4 with FPM and Magento dependencies
FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
RUN apt-get update -qy && apt-get install -qy php-soap php5 php5-curl php5-gd php5-mcrypt php5-mysql php5-fpm
COPY php-fpm.conf /etc/php5/fpm/php-fpm.conf
COPY www-pool.conf /etc/php5/fpm/pool.d/www.conf
CMD ["/usr/sbin/php5-fpm"]
