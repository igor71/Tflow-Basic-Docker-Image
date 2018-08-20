# Tflow-Basic-Docker-Image
Basic Image for building yi/tflow-vnc:xxx docker image

### Pre Requerements:
```
Make sure nvidia/cuda:X.0-cudnnX-devel-ubuntu16.04 image existing on the target server

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-9.0-cudnn7-devel-ubuntu16.04.tar | docker load

docker images

docker tag <image_id> nvidia/cuda:X.0-cudnnX-devel-ubuntu16.04
```
