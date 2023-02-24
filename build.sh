#!/usr/bin/env bash

# init
DOCKER_REGISTRY=$1
BASE_IMAGE=adoptopenjdk/openjdk8:x86_64-alpine-jre8u362-b09
IMAGE_NAME=org.homelab.openjdk-jre
IMAGE_VERSION=8

# build new image
docker build --build-arg SOURCE_IMAGE=$BASE_IMAGE --no-cache -t $DOCKER_REGISTRY/$IMAGE_NAME:$IMAGE_VERSION .

# list docker images with same image name
docker images | grep $IMAGE_NAME

# push image to registry
docker push $DOCKER_REGISTRY/$IMAGE_NAME:$IMAGE_VERSION
