# Tflow-Basic-Docker-Image
### Basic Image for building yi/tflow-vnc:xxx docker image

### Pre Requerements:
```
Make sure nvidia/cuda:10.0-cudnn7-base image existing on the target server

nvidia/cuda:10.0-cudnn7-base  -->> used with tensorflow from version 1.12, Cuda v.10.0.105 & CuDNN v.7.4.1.5

Jenkins suppose to load docker image during buils proccess, if not:

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-10.0-cudnn7-base | docker load

docker images

docker tag <image_id> nvidia/cuda:X.X-cudnnX-base
```

### Manual Buils steps:
```
git clone --branch=master --depth=1 https://github.com/igor71/Tflow-Basic-Docker-Image/

cd Tflow-Basic-Docker-Image

./tflow-build-all.sh
```
