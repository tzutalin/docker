build:
	docker build -t jenkins_slave .;
run:
	docker run --volumes-from jenkins_data -v /var/run/docker.sock:/var/run/docker.sock --name=jenkins_slave jenkins_slave $(url) $(secret)
stop:
	docker stop jenkins_slave; docker rm jenkins_slave
clean:
	docker rmi -f jenkins_slave:latest
