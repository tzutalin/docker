### Build image
```
docker build -t android_java8 .
```

### Usage
Change directory to your project directory, than run:
```
docker run --tty -i -v=$(pwd):/opt/workspace --workdir=/opt/workspace --rm tzutalin/android25  /bin/sh -c "./gradlew assembleRelease"
```

### Env in this docker image:

* Java : openjdk-8
* Android ndk : R14b
* Android SDK : build-tools-22.0.1,build-tools-23.0.3,build-tools-24.0.3,build-tools-25.0.0,build-tools-25.0.1,android-21,android-22,android-23,android-24,android-25,addon-google_apis_x86-google-21,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,sys-img-armeabi-v7a-android-24




