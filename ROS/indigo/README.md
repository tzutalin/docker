### Build image
```
docker build -t tzutalin/ros-indigo .
```

### Usage
Change directory to your project directory, than run:
```
docker run --tty -i -v=$(pwd):/opt/workspace --workdir=/opt/workspace --rm tzutalin/ros-indigo /bin/sh -c "YOUR BUILD CMD"
```
