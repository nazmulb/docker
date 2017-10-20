# PHP & Mysql application using Dockerfile

### Create Mysql container

```
docker run -d --name nazmul_mysql -e MYSQL_ROOT_PASSWORD=123 -v $PWD/website/data:/var/lib/mysql mysql:5.6
```

### To add database table

```
docker exec -it nazmul_mysql bash
root@76aca89ffb49:/# mysql -p -u root
mysql>CREATE DATABASE IF NOT EXISTS myapp
mysql>USE myapp;
mysql>source /var/lib/mysql/myapp.sql
```

### Build nginx PHP image

```
docker build -t 'nazmulb/nginx-php' .
```

### Create PHP app container by linking with Mysql

```
docker run -d -p 7676:80 --name nazmul_website --link nazmul_mysql:mysql -v $PWD/website:/var/www/html nazmulb/nginx-php
```
