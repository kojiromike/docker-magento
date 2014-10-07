## Magento Docker Initializer

This container isn't configured in fig because it's intended to be run manually. You can use it to [install Magento](#installing-magento), or to get access to the filesystem for running tools. You don't even have to build it yourself.

### Pull It

    docker pull kojiromike/magento_init:latest

### Or, Build It Yourself

    docker build --rm init

### Run It

#### Magento Reindex

    docker run --rm --link magento_db_1:db_1 \
               --volumes-from magento_data_1 \
               kojiromike/magento_init \
               php shell/indexer.php reindexall

#### Shell Access for Arbitrary Commands

    docker run --rm --link magento_db_1:db_1 \
               --volumes-from magento_data_1 \
               -ti kojiromike/magento_init bash

#### Install Magento

After setting up the service containers as described in the [main README](https://github.com/kojiromike/docker-magento/README.md), you can use this container to install Magento.

##### Choose a Magento

Either untar a Magento into /srv/magento or provide a tarball mounted at /magento.tar as in the example below. Also set `MAGENTO_HOST` to the hostname or ip address of the Docker host and link the MySQL service and data volume containers.

You can do this with:

    docker run --rm --link magento_db_1:db_1 \
               --env MAGENTO_HOST=$(boot2docker ip) \
               --volumes-from magento_data_1 \
               --volume /path/to/magento.tar:/magento.tar \
               kojiromike/magento_init
