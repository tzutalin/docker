build:
	docker build -t jenkins_master .;
run:
	docker run --volumes-from jenkins_data -p 8081:8080 -p 50000:50000 --env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" --name=jenkins_master jenkins_master
stop:
	docker stop jenkins_master; docker rm jenkins_master
clean:
	docker rmi -f jenkins_master:latest
