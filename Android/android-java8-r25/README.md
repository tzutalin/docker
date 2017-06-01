### Build image
```
docker build -t tzutalin/android25 .
```

### Usage
Change directory to your project directory, than run:
```
docker run --tty -i -v=$(pwd):/opt/workspace --workdir=/opt/workspace --rm tzutalin/android25  /bin/sh -c "./gradlew assembleRelease"
```


