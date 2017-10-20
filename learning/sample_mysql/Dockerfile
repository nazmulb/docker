FROM ubuntu:16.04
ENV MYSQL_ROOT_PASSWORD 123

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -nfs /bin/true /sbin/initctl

#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
#RUN apt-get update
#RUN apt-get upgrade -y

#RUN apt-get -y install perl-base perl-modules perl
#RUN apt-get -yqq install mysql-server mysql-client

RUN apt-get update \ 
    && apt-get install -y debconf-utils \
    && echo mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD | debconf-set-selections \
    && echo mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD | debconf-set-selections \
    && apt-get install -y mysql-server -o pkg::Options::="--force-confdef" -o pkg::Options::="--force-confold" --fix-missing \
    && apt-get install -y net-tools --fix-missing \
    && apt-get install -y mysql-client \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD ./startup.sh /opt/startup.sh

# Volume configuration
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["/bin/bash", "/opt/startup.sh"]
