# For nginx + fastcgi
FROM nginx:1.7
MAINTAINER Michael A. Smith <msmith3@ebay.com>
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY start /start
CMD ["/start"]
