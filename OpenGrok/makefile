build:
	docker build -t opengrok .
run:
	docker run -t -d --name=opengrok -v $(dir):/src -p 8080:8080 opengrok

stop:
	docker stop opengrok;docker rm opengrok

clean:
	docker rmi -f opengrok