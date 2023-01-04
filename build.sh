#!/usr/bin/env bash

# init
REMOTE_IMAGE=adoptopenjdk/openjdk8:x86_64-alpine-jre8u242-b08
DOCKER_REGISTRY=_DOCKER_REGISTRY_
LOCAL_IMAGE=openjdk8
LOCAL_VERSION=1.0.0

# remove any existing images with identical name
docker rmi $DOCKER_REGISTRY/$LOCAL_IMAGE:$LOCAL_VERSION

# build new image
docker build --build-arg SOURCE_IMAGE=$REMOTE_IMAGE --no-cache -t $DOCKER_REGISTRY/$LOCAL_IMAGE:$LOCAL_VERSION .

# remove remote image, to free up disk space
docker rmi $REMOTE_IMAGE

# find new image
docker images | grep $LOCAL_IMAGE
