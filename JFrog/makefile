init:
	mkdir -p jfrog_data
run:
	docker run --name jfrogartifactory -d -v `pwd`/jfrog_data:/var/opt/jfrog/artifactory -p 8085:8081 docker.bintray.io/jfrog/artifactory-oss
stop:
	docker stop jfrogartifactory;docker rm jfrogartifactory
clean:
	rm -rf jfrog_data
	docker rmi -f docker.bintray.io/jfrog/artifactory-oss
backup:
	sudo tar -zcvf frog_data.tar jfrog_data


