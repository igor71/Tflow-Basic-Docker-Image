# Tflow-Horovod-Basic-Docker-Image
### Basic Image for building yi/tflow-vnc:xxx-horovod docker image

### Pre Requerements:
```
Make sure nvidia/cuda:9.0-cudnn7-base image existing on the target server

nvidia/cuda:9.0-cudnn7-base  -->> Image_ID 544c04b3d677, based on ubuntu 16.04, used with tensorflow from version 1.13 and bellow, Cuda v.9.0.176, CuDNN v.7.6.2.24, without preinstalled NCCL libraries

Jenkins suppose to load docker image during buils proccess, if not:

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-9.0-cudnn7-base-nonccl-ubuntu16.04.tar | docker load

docker images

docker tag <image_id> nvidia/cuda:9.0-cudnn7-base-horovod
```

### Manual Buils steps:
```
git clone --branch=1.13- --depth=1 https://github.com/igor71/Tflow-Basic-Docker-Image/

cd Tflow-Basic-Docker-Image

./tflow-build-all.sh
```
### Check Docker Errors
```
docker logs --tail 50 --follow --timestamps <docker_container_name>
```
