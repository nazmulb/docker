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