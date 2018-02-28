FROM ubuntu:12.04
MAINTAINER Nazmul Basher "nazmul.basher@gmail.com"
ENV REFRESHED_AT 2018-02-26
RUN apt-get update
RUN apt-get install -y nginx
RUN echo 'Hi, I am your container' >/usr/share/nginx/www/index.html
EXPOSE 80
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
