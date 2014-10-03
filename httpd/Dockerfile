# For nginx + fastcgi
FROM nginx:1.7
MAINTAINER Michael A. Smith <msmith3@ebay.com>
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/entrypoint.sh", "nginx", "-g", "daemon off;"]
