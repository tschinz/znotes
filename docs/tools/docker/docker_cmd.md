---
tags:
- tools
- docker
---
# `docker` cmd

``` bash
docker
```

## Images
List all currently existing docker images

``` bash
docker images
```

``` bash title="output"
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
docker101tutorial       latest              ef9eb5245be8        4 days ago          27.5MB
alpine/git              latest              94f8849864da        3 weeks ago         28.4MB
continuumio/anaconda3   latest              472a925c4385        7 weeks ago         2.73GB
```

## Pull
Get a docker image from dockerhub

``` bash
pull <containername>:<tag>
```

``` bash
docker pull <containername>:<tag>

docker pull ubuntu:latest
docker pull ubuntu:20.10
docker pull ubuntu
```

# Build
To build an image from a Dockerfile

``` bash
build <imageName>
```

``` bash
docker build
```

``` bash
docker build -t <repoName>/<imageName>:<tagName> .

docker build -t local/app:latest .
```

!!! note
    Please mind the dot `.` at the end.

    As per the above command, Docker will start to build images automatically by reading the instructions from the Dockerfile saved in the current working directory.

build docker with a given name.

``` bash
-t [<repoName>/]<imageName>[:<tagName>]
```

``` bash
-f <path/to/dockerfile>
```

using dockerfile located at a different location.

``` bash
docker build -f </path/to/a/Dockerfile> .
```
## Remove dangling images

Docker images consist of multiple layers. Dangling images, are layers that have no relationship to any tagged images. They no longer serve a purpose and consume disk space.

``` bash
docker rmi $(docker images -f dangling=true -q)
```

On Windows:

``` bash
FOR /f "tokens=\*" %i IN ('docker images -f "dangling=true" -q')
DO docker rmi -f %i
```

# List images and containers

``` bash
docker image ls docker container ls docker container ls -a
```

!!! note
    `ls -a` shows all containers with stopped ones.

To remove all stopped containers:

``` bash
docker container prune
```

# Run

Run a docker image already pulled or build.

``` bash
run <imagename>
```

``` bash
docker run
```

``` bash
-it
```

Run docker in interactive mode

``` bash
docker run -it ubuntu
```

```
-d
```

Run docker in deamonized

``` bash
docker run -it -d ubuntu
```

``` bash
-v <hostPath>:<containerPath>
```

Link host folder to container folder

``` bash
# Windows
docker run -v //c/data:/data ubuntu
# Linux
docker run -v /data:/data    ubuntu
```

``` bash
-p <hostPort>:<containerPort>
```

Forwared container port to host port

``` bash
docker run -p 8080:80 ubuntu
```


``` bash
--name <containername>
```

Use the `--name` flag to give the container a name. Otherwise it is
generated randomly.


``` bash
--entrypoint=<command>
```

overwrite the CMD command within the dockerfile.


Bypass the ENTRYPOINT and run a bash shell
``` bash
docker run -it --entrypoint=/bin/bash myimage -i
```

# Stop an remove a container

docker container stop <container-name or container-id> docker
container rm <container-name or container-id>

Remove a container while running:

docker container rm -f <container-name or container-id>

# Exec

``` bash
exec <imagename> <command>
```

Run a command inside the docker image

``` bash
docker exec -it <dockername> <command>
docker exec -it ubuntu bash
```