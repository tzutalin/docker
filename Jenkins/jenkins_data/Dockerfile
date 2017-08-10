FROM debian:jessie
MAINTAINER Ryan J. McDonough <ryan@damnhandy.com>

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Create the jenkins user
RUN useradd -d "/var/jenkins_home" -u 1000 -m -s /bin/bash jenkins

# Create the folders and volume mount points
RUN mkdir -p /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins

VOLUME ["/var/log/jenkins", "/var/jenkins_home"]

USER jenkins

# Config git unless someone in the container cannot clone submodule
RUN git config --global user.email "tzu.ta.lin@gmail.com" && git config --global user.name "tzutalin"
CMD ["echo", "Data container for Jenkins"]
