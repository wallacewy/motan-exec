#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo $0: usage: ./createTenant.sh group
    exit 1
fi

service_group=$1

cd motan-tenant
git checkout -- src/main/resources/motan_tenant.xml build.sh
sed -i 's/${group}/'"$service_group"'/' src/main/resources/motan_tenant.xml

chmod +x build.sh
./build.sh
./deploy.sh false
