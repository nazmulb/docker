# Mysql server using Dockerfile

### Build nginx PHP image

```
docker build -t 'nazmulb/mysql' .
```

### Create Mysql server container

```
docker run -d -p 3308:3306 --name nazmul_mysql -e -e DB_USER=nazmul -e DB_PASS=123 -e DB_NAME=myapp nazmulb/mysql
```

### Run Mysql client from the server container

```
docker exec -it nazmul_mysql bash
```
