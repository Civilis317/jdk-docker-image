#!/usr/bin/env bash

# init
DOCKER_REGISTRY=$DOCKER_REGISTRY
BASE_IMAGE=adoptopenjdk/openjdk11:x86_64-alpine-jre-11.0.18_10
IMAGE_NAME=openjdk-jre
IMAGE_VERSION=11

# build new image
docker build --build-arg SOURCE_IMAGE=$BASE_IMAGE --no-cache -t $DOCKER_REGISTRY/$IMAGE_NAME:$IMAGE_VERSION .

# list docker images with same image name
docker images | grep $IMAGE_NAME

# push image to registry
docker push $DOCKER_REGISTRY/$IMAGE_NAME:$IMAGE_VERSION
