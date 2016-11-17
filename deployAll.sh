#!/usr/bin/env bash

cd motan-customer
chmod +x build.sh
./build.sh
./deploy.sh

cd ../motan-employee
chmod +x build.sh
./build.sh
./deploy.sh

cd ../motan-item
chmod +x build.sh
./build.sh
./deploy.sh

cd ../motan-order
chmod +x build.sh
./build.sh
./deploy.sh

cd ../motan-shipping
chmod +x build.sh
./build.sh
./deploy.sh

