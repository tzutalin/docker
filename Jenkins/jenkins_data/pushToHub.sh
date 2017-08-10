#!/bin/sh
IMAGE=jenkins_data
docker login
docker tag $IMAGE tzutalin/$IMAGE
docker push tzutalin/$IMAGE
