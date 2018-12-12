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
The new image has been created, and it has also been added to your Docker Hub Repositories.
Next, build the new image to start and enter a new container.
```
docker run -it [Docker Hub username]/golang
```
Then, prepare server.go for starting a server.
```
$ vim server.go
```
```/go/server.go
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Your url path is %s", r.URL.Path[1:])
}
```
Exit the container and make a new image from the container.
The new image should have golang, vim, and server.go.
```
$ exit
$ docker ps -a    // get the container ID
$ docker commit [container ID] [Docker Hub username]/goserver
$ docker push [container ID]
```
The new image has been created, and it has also been added to your Docker Hub Repositories.
Next, build the new image to start a new container with PORT number.
```
$ docker run -p 8080:80 -td [Docker Hub username]/goserver
```
Then, enter the new container and start the server.
```
$ docker ps -a // get the container ID
$ docker exec -it [container ID] /bin/bash
$ go run server.go
```
Finally, acccess "localhost:80"
## Create a goserver without vim and golang.

to be continued ...

# References
 - https://qiita.com/vankobe/items/f4c09e8e4b580651b568

Thank you.

