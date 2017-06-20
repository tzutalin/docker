
### Building and installation

```
$ make build
```

## Run slave

```
$ docker run -v /var/run/docker.sock:/var/run/docker.sock jenkins_slave <http://jenkins-server:port> <secret>

or

$ make run url=<> secret=<>

```

Stop the container
```
$ make stop
```

Clean the image
```
$ make clean
```
