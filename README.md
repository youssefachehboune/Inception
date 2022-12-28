<a href="https://github.com/youssefachehboune/inception">
    <img src="images/docker.png" alt="Logo">
</a>
<br/>
<p align="center">
  <h1 align="center">Inception</h1>

  <p align="center">
    Creating a docker-based WordPress LEMP stack using docker-compose on Alpine Linux or Debian Buster.
    <br/>
    <br/>
  </p>
</p>

## Table Of Contents

* [Definitions](#definitions)
* [Important commands to use docker](#important-commands-to-use-docker)
* [Mandatory part](#mandatory-part)
  * [Nginx](#nginx)

---
## Definitions

### Docker?
 <p>Docker is a tool that uses containers to make creation, deployment, and running of application a lot easier. It binds application and its dependencies inside a container.</p>

### Docker-compose?
<p>Docker Compose is a tool that was developed to help define and share multi-container applications. With Compose, we can create a YAML file to define the services and with a single command, can spin everything up or tear it all down.</p>

### Docker VS Docker-compose

<p>The key difference between docker run versus docker-compose is that docker run is entirely command line based, while docker-compose reads configuration data from a YAML file. </p>

<p>The second major difference is that docker run can only start one container at a time, while docker-compose will configure and run multiple.</p>

### Docker VS Virtual Machine

![My animated logo](images/docker_vs_vm.png)

<p>As you can see each virtual machine has its guest operating system above the host operating system, which makes virtual machines heavy. While on the other hand, Docker containers share the host operating system, and that is why they are lightweight. </p>

<p>Here is a table which concludes on a virtual machine and Docker container differences.</p>

<table>
    <tr>
      <th>Virtual Machine</th>
      <th>Docker Container</th>
    </tr>
    <tr>
      <td>Hardware-level process isolation</td>
      <td>OS level process isolation</td>
    </tr>
    <tr>
      <td>Each VM has a separate OS</td>
      <td>Each container can share OS</td>
    </tr>
    <tr>
      <td>Boots in minutes</td>
      <td>Boots in seconds</td>
    </tr>
    <tr>
      <td>VMs are of few GBs</td>
      <td>Containers are lightweight (KBs/MBs)</td>
    </tr>
    <tr>
      <td>Ready-made VMs are difficult to find</td>
      <td>Pre-built docker containers are easily available</td>
    </tr>
    <tr>
      <td>VMs can move to new host easily</td>
      <td>Containers are destroyed and re-created rather than moving</td>
    </tr>
    <tr>
      <td>Creating VM takes a relatively longer time</td>
      <td>Containers can be created in seconds</td>
    </tr>
    <tr>
      <td>More resource usage</td>
      <td>Less resource usage</td>
    </tr>
</table>

### 🔎 Resources
 - <h4>For Read</h4>
  
   - <a href="https://aws.amazon.com/docker/">What is Docker?</a>
   - <a href="https://docs.docker.com/compose/" >What is Docker-compose?</a>
   - <a href="https://geekflare.com/docker-vs-virtual-machine/" >Docker-vs-virtual-machine?</a>
   - <a href="https://openclassrooms.com/en/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker" >Optimize your deployment by building containers with Docker.</a>
   - <a href="https://cloud.google.com/architecture/best-practices-for-building-containers" >Best practices for building containers</a>

- <h4>For Watch</h4>

  - <a href="https://www.youtube.com/watch?v=rOTqprHv1YE" >What Is Docker? | What Is Docker And How It Works?</a>
  - <a href="https://www.youtube.com/watch?v=pTFZFxd4hOI" >Docker Tutorial for Beginners</a>
  - <a href="https://www.youtube.com/watch?v=HG6yIjZapSA" >Docker Compose Tutorial</a>

</br>
</br>

---
## Important commands to use docker

### Build and Run a new container from a Docker image
```bash
# Build a Docker image
docker build .
# Build a Docker image with specify a tag
docker build -t “my-image” .

# List all Docker images on your system
docker image ls

# Run a new container from a Docker image of ID 1234567890
docker container run 1234567890

# Remove a Docker image of ID 1234567890
docker rmi 1234567890
# Remove all Docker images on the system
docker rmi -f $(docker images -q)
```

### Create and start containers from a **`docker-compose.yml`** file

```bash
# Create and start the containers defined in this 'docker-compose.yml' file
docker-compose up
# Run the containers in the background
docker-compose up -d
# View the status of the containers
docker-compose ps
# Run a new container from a Docker image of ID=1234567890
docker run 1234567890
# Start a bash session inside the container
docker run -it 985c432d1565 /bin/bash
# Remove stopped containers from the Docker host
docker container prune
# Stop the containers
docker-compose stop
```

### Syntax for Dockefile

```docker
FROM allows you to define the source image

RUN allows you to run commands inside your container

ADD allows you to add files to your container

WORKDIR allows you to define your working directory

EXPOSE defines the default listening ports

CMD allows you to set the default command when running your Docker containers.

ENTRYPOINT instruction specifies the command that will be run when the container is started from the image
```

### Syntax for docker-compose

 - <a href="https://meetup.toast.com/posts/277" target="_blank">Syntax for docker-compose</a>

</br>
</br>

---

</br>

## Mandatory part

---

</br>

## **Nginx**

**Nginx is a web server**

- Uses the `debian:buster` image as a base.
- Update the package and Install the nginx and openssl packages ```apt-get update && apt-get install -y nginx openssl```
- Creating a Self-Signed Certificate With OpenSSL

    - [openssl-self-signed-cert](https://www.baeldung.com/openssl-self-signed-cert)

- Expose port `443` listen on port 443 (**the default HTTPS port**) when the container is running.
- Create your custom default config
    
    - [Nginx.conf, Default.conf](https://phsun102.tistory.com/45)
    
    - [Configuring HTTPS servers](http://nginx.org/en/docs/http/configuring_https_servers.html)
    
- Start the Nginx web server in the foreground when the container is started using :
    - `CMD [ "nginx", "-g", "daemon off;" ]`
    
    > in the foreground means that it is running as **the main process** in the container, and **the container will not exit until the process is stopped**.
    > 

---