#!/bin/sh
service tomcat7 start
# link mounted source directory to opengrok
ln -s /src $OPENGROK_INSTANCE_BASE/src

# Remove unncecessary folder for jenkins
cd /src; rm -rf *tmp

# first-time index
echo "** Running first-time indexing"

IGNORE_PATTERNS="-i build -i install -i *.so -i *.png -i *.jpg -i *.dll  -i *.apk" OpenGrok index

# ... and we keep running the indexer to keep the container on
echo "** Waiting for source updates..."
touch $OPENGROK_INSTANCE_BASE/reindex

echo "INOTIFY_NOT_RECURSIVE  $INOTIFY_NOT_RECURSIVE"
py-task-scheduler -f /var/opt/opengrok_task.yaml
