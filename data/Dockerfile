# Data Volume Container for Magento and MySQL
FROM scratch
MAINTAINER Michael A. Smith <msmith3@ebay.com>
COPY . /
VOLUME ["/srv/magento", "/var/lib/mysql"]
# From https://github.com/tianon/dockerfiles/tree/master/true
# All credit to them for the tiny executable
ENTRYPOINT ["/true-asm"]
