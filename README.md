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
1. A container for PHP. Magento requires `mcrypt`, which unfortunately isn't in the Docker official PHP image, so we'll build ours from `debian`.
1. A container for data volumes. The simplest docker container needs a no-op executable like `true` and some files. We'll start from `scratch` and add on from there.

## How do we set it up?

Docker has a nice tool for orchestrating multiple containers for dev environments called [fig](http://fig.sh/). I defined a fig file that builds and connects the aforementioned containers from its Dockerfile in each of the directories named after the service: _httpd_, _php_, _mysql_, _data_. So just run `fig up`.

## How do I get to my data?

If you need to access the data in mysql or php for some reason, you can get it from any of the running containers, but here's how you get a snapshot of the live data:

    docker export datacontainer > datacontainer-$(date +%s).tar
