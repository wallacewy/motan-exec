#!/usr/bin/env bash

cd /opt/motan/motan-tenant

docker_registry="10.58.9.201:5000"
docker_name="motan-tenant"
docker_tag=$(git log --format="%H" -n 1)
docker_img="$docker_registry/$docker_name:$docker_tag"

service_group=$1

git checkout -- src/main/resources/motan_tenant.xml build.sh
sed -i 's/${group}/'"$service_group"'/' src/main/resources/motan_tenant.xml
cp src/main/resources/motan_tenant.xml /opt/motan/exec/$2.xml

docker run -d -p $2:8080 -v /opt/motan/exec/$2.xml:/opt/motan/WEB-INF/classes/motan_tenant.xml $docker_img

echo 'done'

