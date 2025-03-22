#/bin/bash

HOSTROOT=`pwd`
DOCKERROOT=/root
BUILDSCRIPT=build.sh

NAME=box86
cd ./github-scripts/
./docker-setup.txt $NAME-build
cd ..

sleep 5

docker exec $NAME-build /bin/bash -c "./github-scripts/build.sh"
