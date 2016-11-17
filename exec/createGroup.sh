#!/usr/bin/env bash

docker_registry="10.58.9.201:5000"

services=$(echo $1 | tr "," "\n")
for svc in $services
do
    docker_img="$docker_registry/motan-$svc"
    docker run -d $docker_img
done

echo 'done'
