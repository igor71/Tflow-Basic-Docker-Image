# Tflow-Basic-Docker-Image
### Basic Image for building yi/tflow-vnc:xxx docker image

### Pre Requerements:
```
Make sure nvidia/cuda:10.0-cudnn7-base image existing on the target server

nvidia/cuda:10.0-cudnn7-base  -->> used with tensorflow from version 2.0, Cuda v.10.0.130 & CuDNN v.7.5.0.56

Jenkins suppose to load docker image during buils proccess, if not:

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-10.0-cudnn7-base.tar | docker load

docker images

docker tag <image_id> nvidia/cuda:10.0-cudnn7-base
```

### Manual Buils steps:
```
git clone --branch=master --depth=1 https://github.com/igor71/Tflow-Basic-Docker-Image/

cd Tflow-Basic-Docker-Image

./tflow-build-all.sh
```
