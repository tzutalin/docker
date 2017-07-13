#!/bin/sh
IMAGE=py3qt5
docker tag $IMAGE tzutalin/$IMAGE
docker push tzutalin/$IMAGE
