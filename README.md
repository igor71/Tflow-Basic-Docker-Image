# Tflow-Basic-Docker-Image
### Basic Image for building yi/tflow-vnc:xxx docker image

### Pre Requerements:
```
Make sure nvidia/cuda:X.0-cudnnX-devel-ubuntu16.04 or nvidia/cuda:X.0-cudnnX-base images are existing on the target server

nvidia/cuda:X.0-cudnnX-devel-ubuntu16.04 & nvidia/cuda:9.0-cudnn7-base-1.5-1.9 -->> used with tensorflow up to version 1.9

nvidia/cuda:X.0-cudnnX-base  -->> used with tensorflow with version 1.10-1.11 (master branch only)

Jenkins suppose to load docker image during buils proccess, if not:

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-9.0-cudnn7-devel-ubuntu16.04.tar | docker load

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-9.0-cudnn7-base-1.5-1.9.tar | docker load

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-9.0-cudnn7-base.tar | docker load

docker images

docker tag <image_id> nvidia/cuda:X.0-cudnnX-devel-ubuntu16.04

docker tag <image_id> nvidia/cuda:X.0-cudnnX-base
```

### Manual Buils steps:
```
git clone --branch=master --depth=1 https://github.com/igor71/Tflow-Basic-Docker-Image/

cd Tflow-Basic-Docker-Image

./tflow-build-all.sh
```
