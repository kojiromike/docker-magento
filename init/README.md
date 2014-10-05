Please make `MAGENTO_HOST` available to
this container as an environment variable
and link the MySQL service and data volume containers.

For example:

    docker run --rm --link magento_db_1:db_1 \
               --env MAGENTO_HOST=$(boot2docker ip) \
               --volumes-from magento_data_1 \
               "$(docker build init | xargs | awk '{print $NF}')"
