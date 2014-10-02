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

Dockerfiles for everyone!

Dockerfile-http:

    FROM nginx:1.7
    MAINTAINER
```


```bash
#!/bin/bash -e

mkdir -p docker && cd docker

