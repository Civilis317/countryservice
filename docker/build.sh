#!/usr/bin/env bash

cp ../target/countryService.jar .
cp ../src/main/docker/Dockerfile .
cp ../src/main/docker/application.yml .

set -o pipefail

APPNAME=civilis/countryservice

IMAGE=192.168.99.100:6000/${APPNAME}

if [ -z "$1" ];
then
    echo "Version derived from pom: ${POM_VERSION}"
    VERSION=${POM_VERSION}
else
    echo "Version passed as param: $1"
    VERSION="$1"
fi


docker build --no-cache=true -t ${APPNAME}:${VERSION} . | tee build.log || exit 1

docker tag ${APPNAME}:${VERSION} ${IMAGE}:${VERSION}
docker tag ${APPNAME}:${VERSION} ${IMAGE}:latest

docker push ${IMAGE}:${VERSION}
docker push ${IMAGE}:latest


docker images | grep ${IMAGE}
