### Build the image

`make build`


### Clean the image

`make clean`


### Build AOSP

```
docker run -it --user $(id -u) --volume="[Codebase]:[Codebase]" -w `pwd` --rm android-m-buildenv

repo start [BRANCH] --all
source build/envsetup.sh
lunch aosp_arm-eng
make -j4
```
