#!/usr/bin/env bash

cd /opt/motan/motan-tenant

docker_registry="10.58.9.201:5000"
docker_name="motan-tenant"
docker_tag=$(git log --format="%H" -n 1)
docker_img="$docker_registry/$docker_name:$docker_tag"

port=$1

docker ps | grep $docker_img | grep $port | awk '{print $1}' | xargs docker kill
docker ps -a | grep $docker_img | grep Exited | awk '{print $1}' | xargs docker rm

echo 'done'

