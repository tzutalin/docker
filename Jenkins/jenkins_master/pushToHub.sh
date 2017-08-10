#!/bin/sh
IMAGE=jenkins_master
docker login
docker tag $IMAGE tzutalin/$IMAGE
docker push tzutalin/$IMAGE
