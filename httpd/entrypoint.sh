#!/bin/bash

sed -i "s/127.0.0.1:9000/${MAGEPHP_1_PORT##*/}/g" /etc/nginx/conf.d/nginx.conf;
exec "$@"
