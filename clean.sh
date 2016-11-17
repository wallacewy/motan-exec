#!/usr/bin/env bash

docker_img="10.58.9.201:5000"

docker ps | grep $docker_img | awk '{print $1}' | xargs docker kill
docker ps -a | grep $docker_img | awk '{print $1}' | xargs docker rm
docker rmi $(docker images | grep $docker_img | awk $'{print $3}')

#Done
