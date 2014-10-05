## Magento Docker Initializer

After everything in the [main README](../README.md) is done, and you've untarred a Magento into /srv/magento...

Please make `MAGENTO_HOST` available to this container as an environment variable and link the MySQL service and data volume containers.

You can do this with:

    docker run --rm --link magento_db_1:db_1 \
               --env MAGENTO_HOST=$(boot2docker ip) \
               --volumes-from magento_data_1 \
               "$(docker build init | xargs | awk '{print $NF}')"
