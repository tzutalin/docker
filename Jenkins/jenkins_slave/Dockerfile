FROM java:8-jdk
MAINTAINER Jenkins Builds Eng "tzu.ta.lin@gmail.com"

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Add jenkins user (uid is 1000 which is consist to master/data)
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ENV JENKINS_HOME /var/jenkins_home
# Jenkins is run with user `jenkins`, uid = 1000
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

# Add pakcages for apt
USER root
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    openssh-client \
    openssl \
    lxc \
    iptables

# Download slave.jar
ARG VERSION=3.7
RUN mkdir -p /usr/share/jenkins/
RUN curl -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins

USER jenkins
RUN mkdir /var/jenkins_home/.jenkins
VOLUME /var/jenkins_home/.jenkins

WORKDIR /var/jenkins_home

COPY jenkins-slave /usr/local/bin/jenkins-slave
ENTRYPOINT ["jenkins-slave"]
