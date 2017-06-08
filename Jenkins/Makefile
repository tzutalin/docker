build:
	docker build -t jenkins_master .;
init:
	sh createDataFolder.sh
run:
	docker run  -p 8081:8080 -p 50000:50000 --env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" -v `pwd`/data:/var/jenkins_home jenkins_master
stop:
	docker ps -a | grep "jenkins_master" | awk '{print $$1}' | xargs docker rm -f
clean:
	rm -rf data
	docker rmi -f jenkins_master:latest
