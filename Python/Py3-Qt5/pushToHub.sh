#!/bin/sh
IMAGE=py3qt5
docker login
docker tag $IMAGE tzutalin/$IMAGE
docker push tzutalin/$IMAGE
