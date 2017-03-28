#!/usr/bin/env bash

cp ../target/countryService.jar .
cp ../src/main/docker/Dockerfile .
cp ../src/main/docker/application.yml .

set -o pipefail

IMAGE=localhost:5000/civilis/countryService

if [ -z "$1" ];
then
    echo "Version derived from pom: ${POM_VERSION}"
    VERSION=${POM_VERSION}
else
    echo "Version passed as param: $1"
    VERSION="$1.RELEASE"
fi

if [ ! -z "${HTTP_PROXY}" ];
then
  	docker build --no-cache=true --build-arg http_proxy=${HTTP_PROXY} --build-arg https_proxy=${HTTPS_PROXY} --build-arg no_proxy=${NO_PROXY} -t ${IMAGE}:${VERSION} . | tee build.log || exit 1

    HTTP_PROXY=""
    HTTPS_PROXY=""
    NO_PROXY=""
else
  	docker build --no-cache=true -t ${IMAGE}:${VERSION} . | tee build.log || exit 1
fi

ID=$(tail -1 build.log | awk '{print $3;}')
docker tag $ID ${IMAGE}:${VERSION}
docker tag $ID ${IMAGE}:latest

docker push ${IMAGE}:${VERSION}
docker push ${IMAGE}:latest

docker images | grep ${IMAGE}
