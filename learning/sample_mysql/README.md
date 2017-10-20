# Mysql server using Dockerfile

### Build nginx PHP image

```
docker build -t 'nazmulb/mysql' .
```

### Change the security context of the mount point or volume

##### Mac OS X
```
sudo chown -Rt svirt_sandbox_file_t $PWD/data
```

##### Linux OS

```
sudo chcon -Rt svirt_sandbox_file_t $PWD/data
```

### Create Mysql server container

```
docker run -d -p 3308:3306 --name nazmul_mysql -e DB_USER=nazmul -e DB_PASS=123 -e DB_NAME=myapp -v $PWD/data:/var/lib/mysql nazmulb/mysql
```

### Run Mysql client from the server container

```
docker exec -it nazmul_mysql bash
```
