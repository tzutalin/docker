# Dockerfile to build Ubuntu:14.04 + Python2.7 + Qt4
FROM ubuntu:14.04

MAINTAINER Python Builds Eng "tzu.ta.lin@gmail.com"

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
  cmake \
  python-pip \
  python2.7-dev \
  python-qt4 \
  pyqt4-dev-tools \
  xvfb \
  --no-install-recommends


RUN pip install lxml

# Install wine
RUN dpkg --add-architecture i386
RUN apt-get update -y && apt-get install -y software-properties-common && add-apt-repository -y ppa:ubuntu-wine/ppa &&  apt-get update -y && apt-get install -y wine1.7 winetricks
