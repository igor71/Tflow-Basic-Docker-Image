#!/bin/bash
# simulate nvidia-docker
if [[ "$1" != "run" ]]; then
    # for all commands other than "run" - just run docker
    exec docker "$@"
fi
# "run"
shift
NVIDIA_DOCKER="$(curl -s http://localhost:3476/v1.0/docker/cli)"
exec docker run $NVIDIA_DOCKER "$@"
