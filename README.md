# Docker for Magento 1 Extension Development

Work in Progress

## How should we build this?

Normally with Magento you get a plain LAMP stack; Apache with `mod_php`. That's fine, but since Docker containers are so nicely isolated, I want this approach:

     ---------------------       -------------       -------
    | HTTPD/FastCGI Proxy | <-> | FastCGI PHP | <-> | MySQL |
     ---------------------       -------------       -------
                                        \               /
                                     -----------------------
                                    | Data Volume Container |
                                     -----------------------

Separating the HTTP server from the PHP process gives us a more true-to-form web architecture where the web application server is distinct from the web server. It means we can scale and reconfigure the different server layers independently.

## What do we need to get started?

1. A container for the HTTPD. We'll build from `nginx` and try to configure it for FastCGI.
1. A container for MySQL. `mysql:5` should do.
1. A container for PHP. Unfortunately Magento requires `mcrypt`, which isn't in the Docker official PHP image, so we'll build ours from `debian`.
1. A container for data volumes. The simplest docker container needs a no-op executable like `true` and some files, which it can get from a tarball. We'll build a starter kit, but track changes to this one specially.

## How do we set it up?

Dockerfiles for everyone! Each of the aforementioned containers has its own Dockerfile in each of the directories named after the service: _httpd_, _php_, _mysql_, _data_. So you can run the construct simply enough:

    #!/bin/sh

    for dir in httpd php mysql data; do (
        cd "$dir" && docker build -t "mage-${dir}:latest" .
    ); done

Then you just have to run the orchestrated lot of 'em:

    #!/bin/sh

    # Set a random root password for mysql.
    export MYSQL_ROOT_PASSWORD=$(LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom | dd bs=16 count=1)
    docker run -d data:latest --name datacontainer mage-data:latest /true-asm
    docker run -d -P --volume-from datacontainer mage-mysql:latest
    docker run -d -P --volume-from datacontainer mage-php:latest
    docker run -d -P mage-httpd:latest

## How do I get to my data?

If you need to access the data in mysql or php for some reason, you can get it from any of the running containers, but here's how you get a snapshot of the live data:

    docker export datacontainer > datacontainer-$(date +%s).tar


