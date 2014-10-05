# PHP 5.4 with FPM and Magento dependencies
FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
RUN apt-get update -qqy && apt-get install -qqy php-soap php5 php5-curl php5-gd php5-mcrypt php5-mysql php5-fpm
COPY install ./install
CMD ["./install"]
