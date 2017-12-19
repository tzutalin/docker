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

# Limit the memory usage to build on mirco server with less 1G memory
#ENV JAVA_OPTS "-Xms128m -Xmx512m"
#ENV GRADLE_OPTS "-Xmx512m"

# Install Deps
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl libqt5widgets5 && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV ANDROID_NDK_HOME /opt/android-ndk
ENV PATH $PATH:$ANDROID_NDK_HOME

# Install SDK
# --- Download Android SDK tools into $ANDROID_HOME
RUN cd /opt \
    && wget -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O android-sdk-tools.zip \
    && unzip -q android-sdk-tools.zip -d ${ANDROID_HOME} \
    && rm android-sdk-tools.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

RUN yes | sdkmanager --licenses

# --- Platform tools
RUN sdkmanager "emulator" "tools" "platform-tools"

# --- SDKs
# --- Please keep these in descending order!
# --- The `yes` is for accepting all non-standard tool licenses.

# --- Please keep all sections in descending order!
RUN yes | sdkmanager \
    "platforms;android-27" \
    "platforms;android-26" \
    "platforms;android-25" \
    "build-tools;27.0.2" \
    "build-tools;27.0.1" \
    "build-tools;27.0.0" \
    "build-tools;26.0.2" \
    "build-tools;26.0.1" \
    "system-images;android-26;google_apis;x86" \
    "system-images;android-25;google_apis;armeabi-v7a" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services" \
    "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" \
    "add-ons;addon-google_apis-google-23" \
    "add-ons;addon-google_apis-google-22"

# ------------------------------------------------------

# Install Android NDK
RUN wget https://dl.google.com/android/repository/android-ndk-r16-linux-x86_64.zip
RUN unzip android-ndk-r16-linux-x86_64.zip
RUN mv android-ndk-r16 /opt/android-ndk
RUN rm android-ndk-r16-linux-x86_64.zip


# For Android emulator
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libqt5widgets5
ENV QT_QPA_PLATFORM offscreen
ENV LD_LIBRARY_PATH ${ANDROID_HOME}/tools/lib64:${ANDROID_HOME}/emulator/lib64:${ANDROID_HOME}/emulator/lib64/qt/lib


RUN which adb
RUN which android
RUN which ndk-build

# Cleaning
RUN apt-get clean

# GO to workspace
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

RUN echo "sdk.dir=$ANDROID_HOME" > local.properties
