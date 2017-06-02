### Build image
```
docker build -t tzutalin/py2qt4 .
```

### Usage
Change directory to your project directory, than run:
```
docker run --tty -i -v=$(pwd):/opt/workspace --workdir=/opt/workspace --rm tzutalin/py2qt4
```
