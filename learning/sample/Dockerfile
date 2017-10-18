FROM ubuntu:12.04
MAINTAINER Nazmul Basher "nazmul.basher@gmail.com"
ENV REFRESHED_AT 2017-10-18
RUN apt-get -yqq update && apt-get -yqq install nginx 
RUN mkdir -p /var/www/html/website
ADD nginx/global.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
