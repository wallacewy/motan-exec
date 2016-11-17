#!/usr/bin/env bash

docker_registry="10.58.9.201:5000"

services=$(echo $1 | tr "," "\n")
for svc in $services
do
    docker_img="$docker_registry/motan-$svc"
    container_cnt=$(docker ps | grep $docker_img | wc -l)
    if [ 0 == $container_cnt ]; then
        docker run -d $docker_img
    fi
done

echo 'done'

