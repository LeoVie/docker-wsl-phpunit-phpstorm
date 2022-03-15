#!/bin/bash

if [ "$1" == "-h" ]
then
  echo "docker-image-tag.sh DOCKERFILE_PATH DOCKER_IMAGE [TAG]"
  echo "If no tag is passed, the build id will be used as tag"
  exit 0
fi

DOCKERFILE_PATH="$1"
DOCKER_IMAGE="$2"
DOCKER_TAG="$3"
DOCKER_BUILD_ID_FILE=$(pwd)/docker_build_id.txt

# Build docker image and retrieve build id
docker build $DOCKERFILE_PATH --iidfile=$DOCKER_BUILD_ID_FILE
DOCKER_BUILD_ID=`cat $DOCKER_BUILD_ID_FILE`
# Remove prefix "sha256:"
DOCKER_BUILD_ID=${DOCKER_BUILD_ID#"sha256:"}
# Save build it to version file
echo $DOCKER_BUILD_ID > $DOCKERFILE_PATH"version.txt"
# Remove file with docker build id
rm $DOCKER_BUILD_ID_FILE

# If no tag is passed, use build id as tag
if [ "$DOCKER_TAG" == "" ]
then
  DOCKER_TAG=${DOCKER_BUILD_ID}
fi

# Push newly built docker image with tag
docker tag $DOCKER_BUILD_ID $DOCKER_IMAGE:${DOCKER_TAG}
#docker push $DOCKER_IMAGE:${DOCKER_TAG}
