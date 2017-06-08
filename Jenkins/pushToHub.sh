#!/bin/sh
IMAGE=jenkins
docker login
docker tag $IMAGE tzutalin/$IMAGE
docker push tzutalin/$IMAGE
