## Magento Docker Tools Container

This container isn't configured in docker-compose because it's intended to be
run manually. You can use it to [install Magento](#installing-magento), or to
get access to the filesystem for running tools.
You don't even have to build it yourself.

### Pull It

    docker pull kojiromike/magento_tools:latest

### Or, Build It Yourself

    docker build --rm tools

### Run It

##### Note: Container Names

This project is more useful when you can create multiple docker containers for
various Magento projects. To do that, you will need to vary the names of those
projects using either the `-p` flag, the
[`COMPOSE_PROJECT_NAME`](http://docs.docker.com/compose/cli/#compose95project95name)
or the basename of the current working directory (but only alphanumeric
characters are included).

To get started quickly with a consistent name based on the current directory,
run the following:

    export COMPOSE_PROJECT_NAME
    COMPOSE_PROJECT_NAME="${PWD##*/}"
    COMPOSE_PROJECT_NAME="${COMPOSE_PROJECT_NAME//[^[:alnum:]]}"

The below commands all assume you have `COMPOSE_PROJECT_NAME` in the current
environment.

#### Magento Reindex

    docker run --rm --link "${COMPOSE_PROJECT_NAME}"_db_1:db_1 \
               --volumes-from "${COMPOSE_PROJECT_NAME}"_data_1 \
               kojiromike/magento_tools \
               php shell/indexer.php reindexall

#### Shell Access for Arbitrary Commands

    docker run --rm --link "${COMPOSE_PROJECT_NAME}"_db_1:db_1 \
               --volumes-from "${COMPOSE_PROJECT_NAME}"_data_1 \
               -ti kojiromike/magento_tools bash

#### Install Magento

After setting up the service containers as described in the
[main README](https://github.com/kojiromike/docker-magento/blob/master/README.md),
you can use this container to install Magento.

##### Choose a Magento

Either untar a Magento into /srv/magento or provide a tarball mounted at
/magento.tar as in the example below. Link the MySQL service and data volume
containers, and optionally set `MAGENTO_HOST` to the hostname or ip address
of the Docker host.

You can do this with:

    docker run --rm --link "${COMPOSE_PROJECT_NAME}"_db_1:db_1 \
               --volumes-from "${COMPOSE_PROJECT_NAME}"_data_1 \
               --volume /path/to/magento.tar:/magento.tar \
               --volume /path/to/magento-sample-data.tar:/sample.tar \ # Optional
               --env MAGENTO_HOST=$(boot2docker ip) \ # Optional
               kojiromike/magento_tools /usr/local/bin/install_magento

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
