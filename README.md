# Tflow-Horovod-Basic-Docker-Image
### Basic Image for building yi/tflow-vnc:xxx-horovod docker image

### Pre Requerements:
```
Make sure nvidia/cuda:10.0-cudnn7-base-horovod image existing on the target server

nvidia/cuda:10.0-cudnn7-base-horovod  -->> based ubuntu 18.04, used with tensorflow from version 1.14, Cuda v.10.0.130 & CuDNN v.7.6.0.64

Jenkins suppose to load docker image during buils proccess, if not:

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-10.0-cudnn7-base-horovod-ubuntu18.04.tar | docker load

docker images

docker tag <image_id> nvidia/cuda:10.0-cudnn7-base-horovod
```

### Manual Buils steps:
```
git clone --branch=1.1x-horovod --depth=1 https://github.com/igor71/Tflow-Basic-Docker-Image/

cd Tflow-Basic-Docker-Image

./tflow-build-all.sh
```
### Check Docker Errors
```
docker logs --tail 50 --follow --timestamps <docker_container_name>
```
