#!/bin/bash
# Enable docker operations for HOST_USER
if [ -z "$DOCKER_GID" ]; then
    echo "DOCKER_GID is not specified, cannot enable docker"
    exit 1
fi
if [ -z "$HOST_USER" ]; then
    echo "HOST_USER is not specified, cannot enable docker"
    exit 1
fi
# create docker group and add HOST_USER
addgroup --gid "$DOCKER_GID" docker
adduser $HOST_USER docker
