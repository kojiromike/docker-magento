FROM debian:wheezy
MAINTAINER Michael A. Smith <msmith3@ebay.com>
RUN apt-get update -qqy && apt-get install -qqy samba
COPY smb.conf /etc/samba/smb.conf
# May not actually need _all_ these ports...
EXPOSE 137 138 139 445
CMD ["smbd", "-DSF", "-d", "2"]
