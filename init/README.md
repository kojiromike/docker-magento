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

After everything in the [main README](../README.md) is done, and you've untarred a Magento into /srv/magento...

Please make `MAGENTO_HOST` available to this container as an environment variable and link the MySQL service and data volume containers.

You may also provide a /magento.tar file in the root of the container for it to start with.

You can do this with:

    docker run --rm --link magento_db_1:db_1 \
               --env MAGENTO_HOST=$(boot2docker ip) \
               --volumes-from magento_data_1 \
               --volume /path/to/magento.tar:/magento.tar \
               kojiromike/magento_init
