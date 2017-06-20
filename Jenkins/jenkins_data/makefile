init:
	sh createDataFolder.sh
build:
	docker build -t jenkins_data .
create:
	docker create --name=jenkins_data jenkins_data
run:
	docker run -v `pwd`/data:/var/jenkins_home --name=jenkins_data jenkins_data
stop:
	docker stop jenkins_data;docker rm jenkins_data
clean:
	rm -rf data
	docker rmi -f jenkins_data:latest
backup:
	zip -r data.zip data
