# Basic-Docker-Image
### Basic docker image based on ubuntu:16:04 without nvidia packages

### Pre Requerements:
```
Make sure ubuntu:16:04 image existing on the target server

Jenkins suppose to load docker image during buils proccess, if not:

pv /media/common/DOCKER_IMAGES/Basicubuntu-16.04.tar | docker load

docker images

docker tag <image_id> ubuntu:16:04
```
### Manual Buils steps:
```
git clone --branch=develop --depth=1 https://github.com/igor71/Tflow-Basic-Docker-Image/

cd Tflow-Basic-Docker-Image

bash tflow-build-all.sh
```
### Manual Buils Steps For ADAS-BUILD Docker:
```
pv /media/common/DOCKER_IMAGES/Tflow-GUI/9.0-cudnn7-base/yi-tflow-gui-latest.tar | docker load

docker images

docker tag e9395c7651ae yi/tflow-gui:latest

docker build -f Dockerfile.tflow-gui-build -t yi/adas-gui:0.1 .

Run docker image:

pv /media/common/DOCKER_IMAGES/TFlow-Build/yi-adas-gui-0.1.tar | docker load

docker tag e61196da813f yi/adas-gui:0.1

yi-docker tflow-vnc-<your suffix_here> run :<port_number> 1920x1080 --image=yi/adas-gui  --version=0.1

e.g.

yi-docker tflow-vnc-adas run :13 1920x1080 --image=yi/adas-gui  --version=0.1
```
