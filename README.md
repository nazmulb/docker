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

<img alt="Docker container" src="https://raw.githubusercontent.com/nazmulb/docker/master/container.png" height="300px" />

### Docker components:

##### Docker Engine: Docker is a client-server application. The Docker client talks to the Docker server or daemon, which, in turn, does all the work. the Docker daemon called the Docker Engine. Docker ships with a command line client binary, docker, as well as a full RESTful API to interact with the daemon. You can run the Docker daemon and client on the same host or connect your local Docker client to a remote daemon running on another host. You can see Docker’s architecture depicted here:

<img alt="Docker architecture" src="https://raw.githubusercontent.com/nazmulb/docker/master/docker-architecture.png" height="300px" />

##### Docker images: Images are the building blocks of the Docker world. You launch your containers from images. Images are the ”build” part of Docker’s life cycle. They are a layered format, using Union file systems, that are built step-by-step using a series of instructions. For example:

- Add a file.
- Run a command. 
- Open a port.

You can consider images to be the ”source code” for your containers. They are highly portable and can be shared, stored, and updated.

##### Registries: Docker stores the images you build in registries. There are two types of registries: public and private. Docker, Inc., operates the public registry for images, called the Docker Hub. You can create an account on the <a href="https://hub.docker.com/">Docker Hub</a> and use it to share and store your own images.

##### Containers: Docker helps you build and deploy containers inside of which you can package your applications and services. Containers are launched from images and can contain one or more running processes. You can think about images as the building or packing aspect of Docker and the containers as the running or execution aspect of Docker.

A Docker container is:
- An image format.
- A set of standard operations. 
- An execution environment.

Docker borrows the concept of the standard shipping container, used to transport goods globally, as a model for its containers. But instead of shipping goods, Docker containers ship software. It can be created, started, stopped, restarted, and destroyed.

Like a shipping container, Docker doesn’t care about the contents of the container when performing these actions; for example, whether a container is a web server, a database, or an application server. Each container is loaded the same as any other container.

Docker also doesn’t care where you ship your container: you can build on your laptop, upload to a registry, then download to a physical or virtual server, test, deploy to a cluster of a dozen Amazon EC2 hosts, and run. Like a normal shipping container, it is interchangeable, stackable, portable, and as generic as possible.

With Docker, we can quickly build an application server, a message bus, a utility appliance, a CI test bed for an application, or one of a thousand other possible applications, services, and tools. It can build local, self-contained test environments or replicate complex application stacks for production or development purposes.

<img alt="How docker works" src="https://raw.githubusercontent.com/nazmulb/docker/master/how-docker-works.png" height="350px" />