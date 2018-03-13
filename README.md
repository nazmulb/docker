# Docker

### What is Docker?

Docker is a platform for developers and sysadmins to develop, deploy, and run applications with containers. The use of containers to deploy applications is called containerization.

Containerization is increasingly popular because containers are:

- **Flexible:** Even the most complex applications can be containerized.
- **Lightweight:** Containers leverage and share the host kernel.
- **Interchangeable:** You can deploy updates and upgrades on-the-fly.
- **Portable:** You can build locally, deploy to the cloud, and run anywhere.
- **Scalable:** You can increase and automatically distribute container replicas.
- **Stackable:** You can stack services vertically and on-the-fly.

<img alt="Docker container" src="https://raw.githubusercontent.com/nazmulb/docker/master/images/container.png" width="300px" />

### Docker components:

#### Docker Engine: 
Docker is a client-server application. The Docker client talks to the Docker server or daemon, which, in turn, does all the work. the Docker daemon called the Docker Engine. Docker ships with a command line client binary, docker, as well as a full RESTful API to interact with the daemon. You can run the Docker daemon and client on the same host or connect your local Docker client to a remote daemon running on another host. You can see Docker’s architecture depicted here:

<img alt="Docker architecture" src="https://raw.githubusercontent.com/nazmulb/docker/master/images/docker-architecture1.png" width="350px" />

#### Docker images: 
Images are the building blocks of the Docker world. You launch your containers from images. Images are the ”build” part of Docker’s life cycle. They are a layered format, using Union file systems, that are built step-by-step using a series of instructions. For example:

- Add a file.
- Run a command. 
- Open a port.

You can consider images to be the ”source code” for your containers. They are highly portable and can be shared, stored, and updated.

#### Registries: 
Docker stores the images you build in registries. There are two types of registries: public and private. Docker, Inc., operates the public registry for images, called the Docker Hub. You can create an account on the <a href="https://hub.docker.com/">Docker Hub</a> and use it to share and store your own images.

#### Containers: 
Docker helps you build and deploy containers inside of which you can package your applications and services. Containers are launched from images and can contain one or more running processes. You can think about images as the building or packing aspect of Docker and the containers as the running or execution aspect of Docker.

A Docker container is:
- An image format.
- A set of standard operations. 
- An execution environment.

Docker borrows the concept of the standard shipping container, used to transport goods globally, as a model for its containers. But instead of shipping goods, Docker containers ship software. It can be created, started, stopped, restarted, and destroyed.

Like a shipping container, Docker doesn’t care about the contents of the container when performing these actions; for example, whether a container is a web server, a database, or an application server. Each container is loaded the same as any other container.

Docker also doesn’t care where you ship your container: you can build on your laptop, upload to a registry, then download to a physical or virtual server, test, deploy to a cluster of a dozen Amazon EC2 hosts, and run. Like a normal shipping container, it is interchangeable, stackable, portable, and as generic as possible.

With Docker, we can quickly build an application server, a message bus, a utility appliance, a CI test bed for an application, or one of a thousand other possible applications, services, and tools. It can build local, self-contained test environments or replicate complex application stacks for production or development purposes.

<img alt="How docker works" src="https://raw.githubusercontent.com/nazmulb/docker/master/images/how-docker-works.png" width="550px" />

### What are the pros and cons of Docker?

#### Pros:

- **An easy and lightweight way to model reality:** Docker is fast. You can Dockerize your application in minutes. Docker relies on a copy-on-write model so that making changes to your application is also incredibly fast: only what you want to change gets changed. Most Docker containers take less than a second to launch. Containers are highly performant and you can pack more of them into your hosts and make the best possible use of your resources.
- **A logical segregation of duties:** With Docker, Developers care about their applications running inside containers, and Operations cares about managing the containers. Docker is designed to enhance consistency by ensuring the environment in which your developers write code matches the environments into which your applications are deployed. This reduces the risk of ”worked in dev, now an ops problem.”
- **Fast, efficient development life cycle:** Docker aims to reduce the cycle time between code being written and code being tested, deployed, and used. It aims to make your applications portable, easy to build, and easy to collaborate on.
- **Encourages service orientated architecture:** Docker also encourages service-oriented and microservices architectures. Docker recommends that each container run a single application or process. This promotes a distributed application model where an application or service is represented by a series of inter-connected containers. This makes it easy to distribute, scale, debug and introspect your applications.

#### Cons:

- Increased complexity due to an additional layer. This affects not only the deployment but also the development and build.
- In addition, managing a huge amount of containers is challenging – especially when it comes to clustering containers. Tools like <a href="http://kubernetes.io/">Google Kubernetes</a> and <a href="http://mesos.apache.org/">Apache Mesos</a> can help here.
- The containers share the same kernel and are therefore less isolated than real VMs. A bug in the kernel affects every container.
- Docker bases on Linux Containers (LXU), which is a Linux technology. Therefore, we can’t run Docker on other systems and our container is always a Linux system. But <a href="http://boot2docker.io/">Boot2Docker</a> enables the usage of Docker on Windows and Mac OS X by using VirtualBox. The Docker client runs on the host OS and communicates with the Docker daemon inside the VirtualBox. Unfortunately, this is less comfortable and makes daily use clumsy and more complicated than running Docker natively.

### What are the uses of Docker?

- Helping make your local development and build work more faster, more efficient, and more lightweight. Local developers can build, run, and share Docker containers. Containers can be built in development and promoted to testing environments and, in turn, to production.
- Running stand-alone services and applications consistently across multiple environments, a concept especially useful in service-oriented architectures and deployments that rely heavily on micro-services.
- Using Docker to create isolated instances to run tests like, for example, those launched by a Continuous Integration (CI) suite like Jenkins CI.
- Building and testing complex applications and architectures on a local host prior to deployment into a production environment.
- Building a multi-user Platform-as-a-Service (PAAS) infrastructure.
- Providing lightweight stand-alone sandbox environments for developing, testing, and teaching technologies, such as the Unix shell or a programming language.
- Software as a Service applications.
- Highly performant, hyperscale deployments of hosts.

### Install Docker:

Please <a href="https://docs.docker.com/install/">use this doc</a> to install docker. After successful installation, let’s check that the docker binary exists and is functional:

```js
docker info
```

### Working with Docker container:

#### Running our first container:

```js
docker run --name nazmul_first_container -i -t ubuntu bash
```

- `--name` assign a name to the container
- `-i` keeps STDIN (standard input) open from the container that we need for an interactive shell
- `-t` allocate a pseudo-TTY which provides an interactive shell in the new container


So what was happening in the background here? Firstly, Docker checked locally for the `ubuntu` image. If it can’t find the image on our local Docker host, it will reach out to the <a href="https://hub.docker.com/">Docker Hub</a> registry run by Docker, Inc., and look for it there. Once Docker had found the image, it downloaded the image and stored it on the local host.

Docker then used this image to create a new container inside a filesystem. The container has a network, IP address, and a bridge interface to talk to the local host. Finally, we told Docker which command to run in our new container, in this case launching a Bash shell with the `bash` command.

When the container had been created, Docker ran the `bash` command inside it; the container’s shell was presented to us like so:

```js
root@b58f7bfafdbf:/#
```

##### What happens after running `docker run`:

<img alt="What happens after running docker run" src="https://raw.githubusercontent.com/nazmulb/docker/master/images/docker-run.png" width="650px" />

##### Running `docker run` a second time with different container name using the same `ubuntu` image:

<img alt="Running docker run a second time using the same image" src="https://raw.githubusercontent.com/nazmulb/docker/master/images/docker-run-second-time.png" width="650px" />

#### Working with our first container:

We are now logged into a new container, with the catchy ID of `b58f7bfafdbf`, as the `root` user. This is a fully fledged Ubuntu host, and we can do anything we like in it. Let’s explore it a bit, starting with asking for its hostname.

```js
root@b58f7bfafdbf:/# hostname
b58f7bfafdbf
```

We see that our container’s hostname is the container ID. Let’s have a look at the `/etc/hosts` file too.

```js
root@b58f7bfafdbf:/# cat /etc/hosts
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
172.17.0.2      b58f7bfafdbf
```

Docker has also added a host entry for our container with its IP address. We can also check its running processes.

```js
root@b58f7bfafdbf:/# ps -aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1  18244  3168 pts/0    Ss   04:31   0:00 bash
root        16  5.0  0.1  34424  2664 pts/0    R+   06:52   0:00 ps -aux
```

Installing a package in our first container:

```js
root@b58f7bfafdbf:/# apt-get update && apt-get install vim
```

We’ll now have Vim installed in our container. You can keep playing with the container for as long as you like. When you’re done, type `exit`. So what’s happened to our container? Well, it has now stopped running. The container only runs for as long as the command we specified, `bash`, is running. Once we exited the container, that command ended, and the container was stopped.

The container still exists; we can show a list of current containers using the `docker ps -a` command.

```js
CONTAINER ID        IMAGE         NAMES                     COMMAND           CREATED             STATUS              PORTS
                                           
b58f7bfafdbf        ubuntu        nazmul_first_container    "bash"            41 hours ago        Up 41 hours
```

##### Starting a stopped container:

*You can use container name or ID to select the container for applying any commands.*

```js
docker start nazmul_first_container
```

Now if we run the `docker ps` command without the `-a` flag, we’ll see our running containers.

##### Attaching to a container:

Our container will restart with the same options we’d specified when we launched it with the docker run command. So there is an interactive session waiting on our running container. We can reattach to that session using the docker attach command.

```js
docker attach nazmul_first_container
root@b58f7bfafdbf:/#
```

##### Stopping a running container:

```js
docker stop nazmul_first_container
```

#### Creating daemonized containers:

Daemonized containers don’t have the interactive session we’ve just used and are ideal for running applications and services.

##### Creating a long running container:

```js
docker run --name nazmul_daemon_1 -d ubuntu sh -c "while true; do echo hello world; sleep 1; done"
```

- `-d` Run container in background and print container ID
- `-c` CPU shares (relative weight)

We’ve also specified a `while `loop as our container command. Our loop will echo `hello world` over and over again until the container is stopped or the process stops.

##### Fetching the logs of our daemonized container:

```js
docker logs nazmul_daemon_1
hello world
hello world
hello world
hello world
...
```

###### You can see the last 10 logs using `--tail` flag:

```js
docker logs --tail 10 nazmul_daemon_1
```

###### You also follow the last log using `-f` with the `--tail` flag:

```js
docker logs --tail 0 -f nazmul_daemon_1
```

###### To make debugging a little easier, we can also add the `-t` flag to prefix our log entries with timestamps:

```js
docker logs --tail 0 -ft nazmul_daemon_1
```

###### Inspecting the processes of the daemonized container:

```js
docker top nazmul_daemon_1
PID                 USER                TIME                COMMAND
20808               root                0:00                sh -c while true; do echo hello world; sleep 1; done
22190               root                0:00                sleep 1
```

###### To see the statistics of our daemonized container:

```js
docker stats nazmul_daemon_1
CONTAINER           CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
nazmul_daemon_1     0.18%               604KiB / 1.952GiB   0.03%               3.11kB / 0B         32.8kB / 0B         2
```

###### Inspecting a container:

```js
docker inspect nazmul_daemon_1
```
###### Selectively inspecting a container using the `-f` or `--format` flag:

```js
docker inspect -f='{{ .State.Running }}' nazmul_daemon_1
```

###### `docker diff` shows changed files in the container's file system.

```js
docker diff nazmul_daemon_1
```

##### Run a command in a running container using `docker exec`:

We can use a `docker exec` background command to run maintenance, monitoring or management tasks inside a running container. In this case our command will create a new empty file called `/etc/new_config_file` inside our container.

```js
docker exec -d nazmul_daemon_1 touch /etc/new_config_file
```

We can also run interactive tasks like opening a shell inside our daemonized container. In this case our command will create a new `bash` session inside the container.

```js
docker exec -it nazmul_daemon_1 bash
```

##### Restart a container:

```js
docker restart nazmul_daemon_1
```

##### Rename a container:

```js
docker rename nazmul_daemon_1 nazmul_daemon
```

##### Deleting a container:

```js
docker rm nazmul_daemon
```

### Working with Docker images and repositories:

#### Listing Docker images:

```js
docker images
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
ubuntu                   latest              2d696327ab2e        5 months ago        122MB
```

We see that we’ve got an image, from a repository called `ubuntu`. This image was downloaded from a repository. Images live inside repositories, and repositories live on registries. The default registry is the public registry managed by Docker, Inc., <a href="https://hub.docker.com/">Docker Hub</a>.

You can think of an image repository as being much like a Git repository. It contains images, layers, and metadata about those images.

Each repository can contain multiple images (e.g., the ubuntu repository contains images for Ubuntu 12.04, 12.10, 13.04, 13.10, 14.04 and 16.04). Let’s get another image from the ubuntu repository now.

##### Pulling the Ubuntu 14.04 image:

```js
docker pull ubuntu:14.04
14.04: Pulling from library/ubuntu
c954d15f947c: Pull complete
c3688624ef2b: Pull complete
848fe4263b3b: Pull complete
...
```
##### Listing the ubuntu Docker images:

```js
docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
ubuntu                    latest              2d696327ab2e        5 months ago        122MB
ubuntu                    16.04               747cb2d60bbe        4 months ago        122MB
ubuntu                    14.04               dc4491992653        4 weeks ago         222MB
```

Each image is being listed by the tags applied to it, so, for example, 14.04, 16.10 and so on. We can refer to a specific image inside a repository by suffixing the repository name with a colon and a tag name, for example:

```js
docker run -it --name nazmul_new_container ubuntu:14.04 bash
```

This launches a container from the `ubuntu:14.04` image, which is an Ubuntu 14.04 operating system.

**There are two types of repositories:** user repositories, which contain images contributed by Docker users, and top-level repositories, which are controlled by the people behind Docker.

A user repository takes the form of a username and a repository name; for example, `nazmulb/mysql`.
- Username: `nazmulb`
- Repository name: `mysql`

Alternatively, a top-level repository only has a repository name like `ubuntu`.

#### Searching for images:

```js
docker search nginx
NAME                    DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
nginx                   Official build of Nginx.                        7991                [OK]
jwilder/nginx-proxy     Automated Nginx reverse proxy for docker c...   1277                                    [OK]
...
```

#### Building images with a Dockerfile:

The `Dockerfile` uses a basic DSL (Domain Specific Language) with instructions for building Docker images. Once we have a `Dockerfile` we then use the `docker build` command to build a new image from the instructions in the `Dockerfile`.

##### Our first Dockerfile:

Let’s now create a directory and an initial `Dockerfile`. We’re going to build a Docker image that contains a simple web server.

###### Creating a sample repository:

```js
mkdir static_web && cd static_web && touch Dockerfile
```

This directory is our build environment, which is what Docker calls a context or build context. Docker will upload the build context, as well as any files and directories contained in it, to our Docker daemon when the build is run. This provides the Docker daemon with direct access to any code, files or other data you might want to include in the image.

###### Our first Dockerfile:

```js
FROM ubuntu:12.04
MAINTAINER Nazmul Basher "nazmul.basher@gmail.com"
ENV REFRESHED_AT 2018-02-26
RUN apt-get update
RUN apt-get install -y nginx
RUN echo 'Hi, I am your container' >/usr/share/nginx/www/index.html
EXPOSE 80
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
```

The `Dockerfile` contains a series of instructions paired with arguments. Instructions in the `Dockerfile` are processed from the top down, so you should order them accordingly.

Each instruction adds a new layer to the image and then commits the image. Docker executing instructions roughly follow a workflow:

- Docker runs a container from the image.
- An instruction executes and makes a change to the container.
- Docker commits a new layer for the image.
- Docker then runs a new container from this new image.
- The next instruction in the file is executed, and the process repeats until all instructions have been executed.

Here we’ve specified a command for the container to run: `nginx -g "daemon off;"`. This will launch Nginx in the foreground to run our web server.

*Dockerfile instructions:*

- `FROM`: Sets the Base Image for subsequent instructions. Usage: `FROM <image>[:<tag>]`
- `MAINTAINER`: Set the Author field of the generated images. Usage: `MAINTAINER <name>`
- `ENV`: Sets environment variable. Usage: `ENV <key> <value>`
- `RUN`: Execute any commands in a new layer on top of the current image and commit the results. Usage: `RUN <command>`
- `CMD`: Specifies the command to run when a container is launched. It is similar to the `RUN` instruction, but rather than running the command when the container is being built, it will specify the command to run when the container is launched, much like specifying a command to run when launching a container with the `docker run` command. There can only be one `CMD` instruction in a `Dockerfile`. Usage: `CMD ["executable","param1","param2"]`
- `ENTRYPOINT`: We can override the `CMD` instruction on the `docker run` command line. The `ENTRYPOINT` instruction provides a command that isn’t as easily overridden. Instead, any arguments we specify on the `docker run` command line will be passed as arguments to the command specified in the `ENTRYPOINT`. Usage: `ENTRYPOINT ["executable", "param1", "param2"]`
- `EXPOSE`: Informs Docker that the container listens on the specified network ports at runtime. It does not actually publish the port. Usage: `EXPOSE <port> [<port>...]`
- `WORKDIR`: Sets the working directory for the container. Usage: `WORKDIR /path/to/workdir`
- `VOLUME` Adds volumes to any container. Volumes can be shared and reused between containers. A container doesn’t have to be running to share its volumes. Usage: `VOLUME ["/data"]`
- `ADD`: Copies new files, directories or remote file to container. Usage: `ADD <src>... <dest>`
- `COPY`: This is closely related to the `ADD` instruction. The key difference is that the `COPY` instruction is purely focused on copying local files from the build context and does not have any extraction or decompression capabilities. Usage: `COPY <src>... <dest>`
- `USER`: Specifies a user that the image should be run as; Usage: `USER <userName>`
- `ARG`: Defines variables that can be passed at build-time via the `docker build` command. This is done using the `--build-arg <varname>=<value>` flag. Usage: `ARG <name>[=<default value>]` 

###### Building the image from our Dockerfile:

```js
docker build -t 'nazmulb/static_web:v1.1' .
```

We’ve specified the `-t ` option to mark our resulting image with a repository and a name, here the `nazmulb` repository and the image name `static_web`. You can also tag images during the build process by sufixing the tag after the image name with a colon like `v1.1`. The trailing `.` tells Docker to look in the local directory to find the `Dockerfile`.

###### Listing our new Docker image:

```js
docker images nazmulb/static_web
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
nazmulb/static_web   v1.1                c1a45862d4ef        About an hour ago   146MB
```

###### Using the docker history command:

If we want to drill down into how our image was created, we can use the docker history command.

```js
docker history nazmulb/static_web:v1.1
```

###### Launching a container from our new image:

```js
docker run -d -p 7777:80 --name nazmul_static_web nazmulb/static_web:v1.1
```

- `-p`: This flag manages which network ports Docker publishes at runtime. This would bind port `80` on the container to port `7777` on the local host.

###### The docker port command:

```js
docker port nazmul_static_web
80/tcp -> 0.0.0.0:7777
```

###### Connecting to the container via curl:

```js
curl localhost:7777
Hi, I am your container
```

Now we’ve got a simple Docker-based web server :)

#### Logging into the Docker Hub to push the image:

```js
docker login
```

#### Pushing images to the Docker Hub:

```js
docker push nazmulb/static_web
```

Please check the <a href="https://hub.docker.com/">Docker Hub</a>

#### Deleting an image:

```js
docker rmi nazmulb/static_web
```

#### Logout from the Docker Hub:

```js
docker logout
```

### Using Docker to test a static website:

##### Creating a directory for our Sample website Dockerfile:

```js
mkdir sample && cd sample && touch Dockerfile
```

We’re also going to need some Nginx configuration files to run our website. Let’s create a directory called `nginx` inside our `sample` directory to hold them. We can download some example files I’ve prepared earlier from GitHub.

##### Getting our Nginx configuration files:

```js
mkdir nginx && cd nginx
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample/nginx/global.conf
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample/nginx/nginx.conf
cd ..
```

##### Our basic Dockerfile for the Sample website:

```js
FROM ubuntu:12.04
MAINTAINER Nazmul Basher "nazmul.basher@gmail.com"
ENV REFRESHED_AT 2018-03-02
RUN apt-get -yqq update && apt-get -yqq install nginx 
RUN mkdir -p /var/www/html/website
ADD nginx/global.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
ENTRYPOINT ["nginx"]
```

Here we’ve written a simple `Dockerfile` that:
- Installs Nginx.
- Creates a directory, `/var/www/html/website/`, in the container.
- Adds the Nginx configuration from the local files we downloaded to our image.
- Exposes port `80` on the image.

Our two Nginx configuration files configure Nginx for running our Sample website.

##### Building our new Nginx image:

```js
docker build -t 'nazmulb/nginx' .
```

##### Downloading our Sample website:

```js
mkdir website && cd website && mkdir css && cd css
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample/website/css/style.css
cd ..
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample/website/index.html
cd ..
```

##### Running our first Nginx testing container:

```js
docker run -d -p 7878:80 --name nazmul_website -v $PWD/website:/var/www/html/website nazmulb/nginx
```

- `-v`: Allows us to create a volume in our container from a directory on the host. Volumes are specially designated directories within one or more containers that bypass the layered Union File System to provide persistent or shared data for Docker.

##### Viewing the Sample website container:

```js
docker ps
CONTAINER ID        IMAGE              COMMAND      CREATED             STATUS           PORTS                  NAMES
b2516584e24b        nazmulb/nginx      "nginx"      5 minutes ago       Up 5 minutes     0.0.0.0:7878->80/tcp   nazmul_website
```

Now browse the Sample website using <a href="http://localhost:7878/">http://localhost:7878</a>

##### Editing our Sample website:

```js
cd website
vim index.html
```

Change some texts in the `index.html` file and save it. Agian browse the Sample website using <a href="http://localhost:7878/">http://localhost:7878</a>. We see that our Sample website has been updated :)


### Using Docker to build a PHP & Mysql based web application:

##### Creating a directory for running the web application:

```js
mkdir sample_php && cd sample_php && mkdir website && cd website && mkdir css && cd css
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/website/css/style.css
cd ..
mkdir data && cd data
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/website/data/myapp.sql
cd ..
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/website/db.php
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/website/index.php
cd ..
```

##### Running our Mysql container:

```js
docker run -d -p 3308:3306 --name nazmul_mysql -e MYSQL_ROOT_PASSWORD=123 -v $PWD/website/data:/var/lib/mysql mysql:5.6
```

##### Running our Mysql client from the container and import database table:

```js
docker exec -it nazmul_mysql bash
root@259cbca5f9f3:/# mysql -p -u root
mysql>source /var/lib/mysql/myapp.sql
```

##### Getting our Nginx Dockerfile and configuration files:

```js
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/Dockerfile
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/default
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/start.sh
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/supervisord.conf

sudo chmod +x ./start.sh
```

##### Building Nginx PHP image:

```js
docker build -t 'nazmulb/nginx-php' .
```

##### Running our Nginx PHP container by connecting with Mysql:

```js
docker run -d -p 7676:80 --name nazmul_website --link nazmul_mysql:mysql -v $PWD/website:/var/www/html nazmulb/nginx-php
```

Now browse the website using <a href="http://localhost:7676/">http://localhost:7676</a>

As you see we connected the Nginx PHP container with the Mysql container. The two realistic methods for connecting containers are Docker Networking and Docker links. Here we used Docker links. The `--link` flag creates a client-service link between two containers. The flag takes two arguments: the container name to link and an alias for the link. In this case, we’re creating a client relationship, our `nazmul_website` container is the client, with the `nazmul_mysql` container, which is the ”service”. We’ve also added an alias for that ”service” of `mysql`.

### Docker Compose:

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

Using Compose is basically a three-step process:

- Define your app’s environment with a `Dockerfile` so it can be reproduced anywhere.

- Define the services that make up your app in `docker-compose.yml` so they can be run together in an isolated environment.

- Run `docker-compose up` and Compose starts and runs your entire app.

Compose has commands for managing the whole lifecycle of your application:

- Start, stop, and rebuild services
- View the status of running services
- Stream the log output of running services
- Run a one-off command on a service

#### Using Docker Compose to build a PHP & Mysql based web application:

##### Creating a directory for running the web application:

```js
mkdir compose_app && cd compose_app && mkdir website && cd website && mkdir css && cd css
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/website/css/style.css
cd ..
mkdir data && cd data
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/website/data/myapp.sql
cd ..
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/website/db.php
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/website/index.php
cd ..
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/Dockerfile
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/default
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/start.sh
wget https://raw.githubusercontent.com/nazmulb/docker/master/learning/sample_php/supervisord.conf
sudo chmod +x ./start.sh
```

##### Creating the docker-compose.yml file:

```js
touch docker-compose.yml
```

After creating `docker-compose.yml` please paste the following:

```js
version: '3'
services:
  mysql:
    image: mysql:5.6
    volumes:
      - ./website/data:/var/lib/mysql
    ports:
      - "3308:3306"
    environment:
      MYSQL_ROOT_PASSWORD: 123

  nginx:
    links:
     - mysql
    build: .
    volumes:
      - ./website:/var/www/html
    ports:
      - "7676:80"
```

For more information about the Compose file, see the <a href="https://docs.docker.com/compose/compose-file/">Compose file reference</a>.

##### Running our app in background using compose:

```js
docker-compose up -d
```

##### Listing our container:

```js
docker-compose ps
       Name                    Command             State               Ports
----------------------------------------------------------------------------------------
composeapp_mysql_1   docker-entrypoint.sh mysqld   Up      0.0.0.0:3308->3306/tcp
composeapp_nginx_1   ./start.sh                    Up      443/tcp, 0.0.0.0:7676->80/tcp
```

##### Running our Mysql client from the container and import database table:

```js
docker exec -it composeapp_mysql_1 bash
root@5f25ba1f19a3:/# mysql -p -u root
mysql>source /var/lib/mysql/myapp.sql
```

Now browse the website using <a href="http://localhost:7676/">http://localhost:7676</a>

##### Showing services logs:

```js
docker-compose logs
```

##### Stopping running services:

```
docker-compose stop 
```

Stops running services without removing them. They can be started again with `docker-compose start`.

We can stop only one service:

```
docker-compose stop nginx
```

##### Start service:

```
docker-compose start nginx
```

##### Run a command against a service:

We can run a one-time command against a service. For example, the following command starts the `nginx` service and runs `bash` as its command.

```
docker-compose run mysql bash
```

##### Removing Compose services:

```
docker-compose rm
```

If we want to stop and remove them:

```
docker-compose down
```

##### Volume List:

```
docker volume ls
```

##### Remove volume:

```
docker volume rm <volume name>
```

Happy learning :)