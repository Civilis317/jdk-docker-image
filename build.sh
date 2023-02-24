#!/usr/bin/env bash

# init
DOCKER_REGISTRY=$DOCKER_REGISTRY
BASE_IMAGE=eclipse-temurin:17.0.6_10-jre-alpine
IMAGE_NAME=org.homelab.openjdk-jre
IMAGE_VERSION=17

# build new image
docker build --build-arg SOURCE_IMAGE=$BASE_IMAGE --no-cache -t $DOCKER_REGISTRY/$IMAGE_NAME:$IMAGE_VERSION .

# list docker images with same image name
docker images | grep $IMAGE_NAME

# push image to registry
docker push $DOCKER_REGISTRY/$IMAGE_NAME:$IMAGE_VERSION
