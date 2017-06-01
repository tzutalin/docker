FROM ubuntu:14.04

MAINTAINER Mobile Builds Eng "tzu.ta.lin@gmail.com"

# Sets language to UTF8 : this works in pretty much all cases
ENV LANG en_US.UTF-8
RUN locale-gen $LANG
ENV DOCKER_ANDROID_LANG en_US

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive


# Update apt-get
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
  autoconf \
  build-essential \
  bzip2 \
  curl \
  gcc \
  git \
  groff \
  lib32stdc++6 \
  lib32z1 \
  lib32z1-dev \
  lib32ncurses5 \
  lib32bz2-1.0 \
  libc6-dev \
  libgmp-dev \
  libmpc-dev \
  libmpfr-dev \
  libxslt-dev \
  libxml2-dev \
  m4 \
  make \
  ncurses-dev \
  ocaml \
  openssh-client \
  pkg-config \
  python-software-properties \
  rsync \
  software-properties-common \
  unzip \
  wget \
  zip \
  zlib1g-dev \
  --no-install-recommends

# Install Java
RUN apt-add-repository ppa:openjdk-r/ppa && apt-get update && apt-get -y install openjdk-8-jdk
# Export JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
# Support Gradle
ENV TERM dumb
ENV JAVA_OPTS "-Xms4096m -Xmx4096m"
ENV GRADLE_OPTS "-XX:+UseG1GC -XX:MaxGCPauseMillis=1000"

# Install Deps
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl libqt5widgets5 && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy install tools
COPY tools /opt/tools
RUN ["chmod", "+x", "/opt/tools/android-accept-licenses.sh"]
ENV PATH ${PATH}:/opt/tools

# Install Android SDK
RUN cd /opt && wget --output-document=android-sdk.tgz --quiet https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
  tar xzf android-sdk.tgz && \
  rm -f android-sdk.tgz && \
  chown -R root.root android-sdk-linux && \
  /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools,tools" && \
  /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools,tools,build-tools-22.0.1,build-tools-23.0.3,build-tools-24.0.3,build-tools-25.0.0,build-tools-25.0.1,android-21,android-22,android-23,android-24,android-25,addon-google_apis_x86-google-21,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,sys-img-armeabi-v7a-android-24"

# Install Android NDK
RUN wget https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip
RUN unzip android-ndk-r14b-linux-x86_64.zip
RUN mv android-ndk-r14b /opt/android-ndk
RUN rm android-ndk-r14b-linux-x86_64.zip

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV ANDROID_NDK_HOME /opt/android-ndk
ENV PATH $PATH:$ANDROID_NDK_HOME

RUN which adb
RUN which android
RUN which ndk-build

# Cleaning
RUN apt-get clean

# GO to workspace
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

RUN echo "sdk.dir=$ANDROID_HOME" > local.properties
