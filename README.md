# What is this?
This is an introduction to Docker.
You can make a go server on a Docker container.

# Prerequisites
 - Docker v18.09.0
 - your Docker Hub account

# How to use?
## Create a go server
First, get a golang image from Docker Hub.
You will edit this image.
```
$ docker pull golang
```
Then, build the image to start and enter a new container.
```
$ docker run -it golang
```
You are now in the new container made from the golang image.
Install vim to edit text files.
```
$ apt-get update
$ apt-get upgrade
$ apt-get install vim
```
Exit the container and make a new image from the container.
The new image should have golang and vim.
```
$ exit
$ docker ps -a    // get the container ID
$ docker commit [container ID] [Docker Hub username]/golang
$ docker push [container ID]
```
The new image has been added to your Docker Hub repositories.
Next, write server.go to start a server.

to be continued ...

# References
 - https://qiita.com/vankobe/items/f4c09e8e4b580651b568

Thank you.

