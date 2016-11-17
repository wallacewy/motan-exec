#!/usr/bin/env bash

docker_img=hyper.cd/core/redis:3.2.0


docker ps | grep $docker_img | awk '{print $1}' | xargs docker kill
docker ps -a | grep $docker_img | awk '{print $1}' | xargs docker rm

docker run -d -p 6379:6379 --name cloud-redis $docker_img --protected-mode no

#done
