### Build image
```
docker build -t tzutalin/ros-indigo .
```

### Usage
Change directory to your project directory, than run docker in interactive mode:
```
docker run --tty -i -v=$(pwd):/opt/workspace --workdir=/opt/workspace --rm tzutalin/ros-indigo /bin/sh -c "YOUR BUILD CMD"
```

Run GUI app in the docker container
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
    tzutalin/ros-indigo
```
