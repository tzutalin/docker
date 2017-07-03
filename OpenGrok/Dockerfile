FROM itszero/opengrok

MAINTAINER Opengrok Builds Eng "tzu.ta.lin@gmail.com"

# Add dep for py-task-scheduler
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
  pkg-config \
  python-software-properties \
  unzip \
  wget \
  zip \
  python-pip \
  --no-install-recommends

RUN pip install --upgrade pip
RUN pip install -U setuptools
RUN pip install py-task-scheduler

# Export opengrok to PATH
ENV PATH="/opengrok/bin:${PATH}"

# Copy task yaml file to index periodically
ADD opengrok_task.yaml /var/opt/opengrok_task.yaml
# Copy start script
ADD exec.sh /var/opt/exec.sh

ENTRYPOINT ["/var/opt/exec.sh"]
