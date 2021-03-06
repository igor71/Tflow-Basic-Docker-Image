#!/usr/bin/env bash
EXTRA_FLAGS="--no-cache"

TFLOW_VER=latest
TFLOW_GUI_VER=latest

docker build $EXTRA_FLAGS -f Dockerfile.tflow -t yi/tflow:${TFLOW_VER} . && \
docker build $EXTRA_FLAGS -f Dockerfile.tflow-gui -t yi/tflow-gui:${TFLOW_GUI_VER} . 