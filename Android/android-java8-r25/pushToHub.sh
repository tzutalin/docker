#!/bin/sh
IMAGE=android_java8
docker login
docker tag $IMAGE tzutalin/$IMAGE
docker push tzutalin/$IMAGE
