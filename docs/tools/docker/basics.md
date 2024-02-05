---
tags:
- tools
- docker
---
#  Basics

![](img/logo.svg){.center width="70.0%"}

## Containers

Imagine you'd like run a command isolated from everything else on the system. It should only access exactly the resources it is allowed to (storage, CPU, memory), and does not know there is anything else on the machine. The process running inside a container thinks it's the only one and only sees a barebones Linux distro the stuff which is described in the image.

## Images

An image, is a blueprint from which an arbitrary number of brand-new containers can be started. Images can't change, but you can start a container from an image, perform operations in it and save another image based on the latest state of the container. No "currently running commands" are saved in an image. When you start a container it's a bit like booting up a machine after it was powered down.

It's like a powered down computer (with software installed), which is ready to be executed with a single command. Only instead of starting the computer, you create a new one from scratch (container) which looks exactly like the one you chose (image).

When starting a container from an image, you usually don't rely on the defaults being right - you provide arguments to the command being executed, mount volumes (directories with data) with your own data and configurations and wire up the container to the network of the host in a way which suits you.

## Dockerfiles

See also [dockerfile](dockerfile.md)

A Dockerfile is a set of precise instructions, stating how to create a new Docker image, setting defaults for containers being run based on it and a bit more. In the best case it's going to create the same image for anybody running it at any point in time.
Dockerfiles can be seen as the instructions to set up a project - but in executable code. A script which installs the operating system, all necessary parts and makes sure that everything else is in place too.

In a Dockerfile, you usually choose what image to take as the "starting point" for further operation (`FROM`), you can execute commands (starting containers from the image of the previous step, executing it, and saving the result as the most-recent image) (`RUN`) and copy local files into the new image (`COPY`). Usually, you also specify a default command to run (`ENTRYPOINT`) and the default arguments (`CMD`) when starting a container from this image.

## Volumes

But having data persist is really useful. That's where volumes come in. When starting a Docker container, you can specify that certain directories are mount points for either local directories (of the host machine), or for volumes. Data written to host-mounted directories is straightforward to understand (as you know where it is), volumes are for having persistent or shared data, but you don't have to know anything about the host when using them. You can create a volume, Docker makes sure that it's there and saved somewhere on the host system.

When a container exits, the volumes it was using stick around. So if you start a second container, telling it to use the same volumes, it will have all the data of the previous one. You can manage containers using Docker commands (to remove them for example). Docker compose makes dealing with volumes even easier.

## Port Forwarding

By default, a container is not accessible by other containers, nor from the outside world. However, you can tell Docker to expose a container port to a port of the host machine (either the 127.0.0.1 interface or an external one).
