FROM ubuntu:16.04

# Prepare the Build Environment
RUN apt-get update \
 && apt-get install -y software-properties-common \
 && add-apt-repository ppa:openjdk-r/ppa -y \
 && apt-get update \
 && apt-get install -y \
    openjdk-7-jdk \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    make \
    python-networkx \
    ca-certificates \
    bsdmainutils \
    imagemagick \
    schedtool \
    maven \
    dos2unix \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install repo
RUN mkdir -p /usr/local/repo/bin \
 && curl https://storage.googleapis.com/git-repo-downloads/repo > \
    /usr/local/repo/bin/repo \
 && chmod +x /usr/local/repo/bin/repo
ENV PATH /usr/local/repo/bin:$PATH
