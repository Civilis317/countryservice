#!/usr/bin/env bash

set -o pipefail

IMAGE=localhost:6000/civilis/apachejessie
VERSION=1.0

if [ ! -z "${HTTP_PROXY}" ];
then
  	docker build --no-cache=true --build-arg http_proxy=${HTTP_PROXY} --build-arg https_proxy=${HTTPS_PROXY} --build-arg no_proxy=${NO_PROXY} -t ${IMAGE}:${VERSION} . | tee build.log || exit 1

    HTTP_PROXY=""
    HTTPS_PROXY=""
    NO_PROXY=""
else
  	docker build -t ${IMAGE}:${VERSION} . | tee build.log || exit 1
fi

ID=$(tail -1 build.log | awk '{print $3;}')
docker tag $ID ${IMAGE}:${VERSION}
docker tag $ID ${IMAGE}:latest

docker push ${IMAGE}:${VERSION}
docker push ${IMAGE}:latest

docker images | grep ${IMAGE}


