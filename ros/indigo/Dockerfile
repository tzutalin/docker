# Dockerfile to build Ubuntu:14.04 + ROS-Indigo-desktop-full
FROM ubuntu:14.04

MAINTAINER Mobile Builds Eng "tzu.ta.lin@gmail.com"

# Sets language to UTF8 : this works in pretty much all cases
ENV LANG en_US.UTF-8
RUN locale-gen $LANG
ENV DOCKER_ANDROID_LANG en_US

# Add some dep
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

# CMake 3.x
RUN apt-get install -y software-properties-common && add-apt-repository ppa:george-edison55/cmake-3.x && apt-get update && apt-get install -y cmake

# ROS Indigo desktop full installation
RUN wget http://packages.ros.org/ros.key -O - | apt-key add -

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116 && apt-get update && apt-get install -y ros-indigo-desktop-full
RUN rosdep init
RUN rosdep update
RUN echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc

# ROS python
RUN apt-get install -y python-rosinstall
