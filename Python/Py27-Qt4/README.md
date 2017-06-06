### Build image
```
docker build -t tzutalin/py2qt4 .
```

### Usage
Change directory to your project directory, than run in the interactive mode:
```
docker run -it -v=$(pwd):$(pwd) --workdir=$(pwd) --rm tzutalin/py2qt4
```

Run PyQt app on the container
```
    docker run -it \
    --user $(id -u) \
    -e DISPLAY=unix$DISPLAY \
    --workdir="/home/$USER" \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    tzutalin/py2qt4
```
