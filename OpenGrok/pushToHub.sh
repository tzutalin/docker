#!/bin/sh
IMAGE=opengrok
docker login
docker tag $IMAGE tzutalin/$IMAGE
docker push tzutalin/$IMAGE
