## Magento Docker Tools Container

This container isn't configured in fig because it's intended to be run manually. You can use it to [install Magento](#installing-magento), or to get access to the filesystem for running tools. You don't even have to build it yourself.

### Pull It

    docker pull kojiromike/magento_tools:latest

### Or, Build It Yourself

    docker build --rm tools

### Run It

#### Magento Reindex

    docker run --rm --link magento_db_1:db_1 \
               --volumes-from magento_data_1 \
               kojiromike/magento_tools \
               php shell/indexer.php reindexall

#### Shell Access for Arbitrary Commands

    docker run --rm --link magento_db_1:db_1 \
               --volumes-from magento_data_1 \
               -ti kojiromike/magento_tools bash

#### Install Magento

After setting up the service containers as described in the [main README](https://github.com/kojiromike/docker-magento/README.md), you can use this container to install Magento.

##### Choose a Magento

Either untar a Magento into /srv/magento or provide a tarball mounted at /magento.tar as in the example below. Also set `MAGENTO_HOST` to the hostname or ip address of the Docker host and link the MySQL service and data volume containers.

You can do this with:

    docker run --rm --link magento_db_1:db_1 \
               --env MAGENTO_HOST=$(boot2docker ip) \
               --volumes-from magento_data_1 \
               --volume /path/to/magento.tar:/magento.tar \
               --volume /path/to/magento-sample-data.tar:/sample.tar \ # Optional
               kojiromike/magento_tools
               /usr/local/bin/install_magento

## Available Tools:

- [cURL](http://curl.haxx.se/)
- [composer](https://getcomposer.org/)
- [git](http://git-scm.com/)
- [modman](https://github.com/colinmollenhour/modman)
- [MySQL Client](http://dev.mysql.com/doc/refman/5.6/en/programs-client.html)
- [n98-magerun](https://github.com/netz98/n98-magerun)
- [phpDocumentor](http://www.phpdoc.org/)
- [phploc](https://github.com/sebastianbergmann/phploc)
- [PHP Copy/Paste Detector](https://github.com/sebastianbergmann/phpcpd)
- [PHP Depend](http://pdepend.org/)
- [PHP Mess Detector](http://phpmd.org/)
- [PHP\_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)
- [vim](http://www.vim.org/about.php)
