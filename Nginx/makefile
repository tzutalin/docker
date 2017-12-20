build:
	git clone https://github.com/tzutalin/tzutalin.github.io src
	docker build -t tzutalin .
run:
	docker run -t -d --name=tzutalin -p 80:80 tzutalin

stop:
	docker stop tzutalin;docker rm tzutalin

clean:
	docker rmi -f tzutalin
