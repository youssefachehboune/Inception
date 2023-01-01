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

## **Mandatory part**

---

</br>

## **Nginx**

**NGINX is a web server that is widely used for hosting websites and applications. It is known for its high performance, reliability**

- Uses the `debian:buster` image as a base.
- Update the package and Install the nginx and openssl packages ```apt-get update && apt-get install -y nginx openssl```
- Creating a Self-Signed Certificate With OpenSSL

    - [openssl-self-signed-cert](https://www.baeldung.com/openssl-self-signed-cert)

- Create your custom default config
    
    - [Nginx.conf, Default.conf](https://phsun102.tistory.com/45)
    
    - [Configuring HTTPS servers](http://nginx.org/en/docs/http/configuring_https_servers.html)
    
- Start the Nginx web server in the foreground when the container is started using :
    - `CMD [ "nginx", "-g", "daemon off;" ]`
    
    > in the foreground means that it is running as **the main process** in the container, and **the container will not exit until the process is stopped**.

- [What are SSL/TLS Certificates? Why do we Need them? and How do they Work?](https://www.youtube.com/watch?v=r1nJT63BFQ0)

- [Transport Layer Security, TLS 1.2 and 1.3](https://www.youtube.com/watch?v=AlE5X1NlHgg)
- [Learn CGI and FastCGI](https://server-talk.tistory.com/308)

- [PHP-fastcgi](https://www.nginx.com/resources/wiki/start/topics/examples/phpfcgi/)
---
<br/>

## **MariaDB**
**MariaDB is widely used as a database management system, particularly in Linux environments. It is known for its speed, reliability, and security.**

- Uses the `debian:buster` image as a base.
- Update the package and Install mariadb-server ```apt-get update && apt-get install -y mariadb-server```
- Creating a database and user:
    
    ````use `-e` option to specify the command to be executed by the `mysql` command-line````

- [mysqld_safe](https://dev.mysql.com/doc/refman/8.0/en/mysqld-safe.html#:~:text=mysqld_safe%20is%20the%20recommended%20way,given%20later%20in%20this%20section.)

- [Change MariaDB root password](https://www.digitalocean.com/community/tutorials/how-to-reset-your-mysql-or-mariadb-root-password)

___
<br/>

## **WordPress**
**WordPress is a content management system (CMS) based on PHP and MySQL. It is an open-source platform that is widely used for building websites, blogs, and applications.**

- Uses the debian:buster image as a base.
- Install php-fpm and php-mysql mariadb-client wget curl using

  ``` apt-get update && apt-get -y install php-fpm php-mysql mariadb-client wget curl ```
- Download wordpress in ``` /var/www/html ``` From  ``` https://wordpress.org/latest.tar.gz ```

- Listen to **9000** port in ``` /etc/php/7.3/fpm/pool.d/www.conf ```

- curl ``` https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ```  and move it to ``` /usr/local/bin/wp ```

- create wp-config using ``` wp config create ```

- install WordPress on our web server using ``` wp core install ```

- create a user in wordpress with author role using ``` wp user create ```

### 🔎 Resources
- [install wordpress using wp-cli](https://www.cloudways.com/blog/install-wordpress-using-wp-cli/)
- [wp user create | WP-CLI Command | WordPress Developer Resources](https://developer.wordpress.org/cli/commands/user/create/)
- [start php-fpm in foreground](https://stackoverflow.com/questions/37313780/how-can-i-start-php-fpm-in-a-docker-container-by-default)