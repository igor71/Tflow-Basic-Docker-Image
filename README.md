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

./tflow-build-all.sh
```

