#!/bin/sh
IMAGE=py2qt4
docker login
docker tag $IMAGE tzutalin/$IMAGE
docker push tzutalin/$IMAGE
