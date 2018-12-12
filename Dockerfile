# the below code means you will make a new image based on a golang image.
FROM golang
MAINTAINER uriha421
# the below code means moving all files in . to /go/src/ in a new container
ADD . /go/src/
# the below code means a new container exposes PORT80 in the host machine
EXPOSE 80
# the below code means executing "go run server.go" at /go/src/ in a new conrtainer
CMD ["usr/local/go/bin/go", "run", "/go/src/server.go"]
