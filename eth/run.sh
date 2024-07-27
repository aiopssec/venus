#!/usr/bin/env bash

# 需要升级版本，修改这里的版本号后，执行一下run.sh脚本即可。
VERSION=1.14.7
BEACON_VERSION=5.0.4

docker build --build-arg VERSION=${VERSION} --build-arg BEACON_VERSION=${BEACON_VERSION} -t eth:${VERSION} .
docker stop eth
docker rm eth
docker run --init -d --name eth -p 3500:3500 -p 8545:8545 -p 8546:8546 -v /data/eth:/eth --restart=always eth:${VERSION}