FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
WORKDIR /var/www/html/
RUN apt-get update -qy && apt-get install -qy apache2 php-soap php5 php5-curl php5-gd php5-mcrypt php5-mysql mysql-client
# libapache2-mod-proxy-html mysql-client && a2enmod proxy
ADD httpd.conf /etc/apache2/sites-available/default
EXPOSE 80
