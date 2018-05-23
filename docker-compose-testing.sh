#!/bin/bash
echo "docker login -u nike1niec -p $DOCKER_LOGIN"
docker login -u nike1niec -p $DOCKER_LOGIN

docker-compose up
