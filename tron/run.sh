#!/usr/bin/env bash

# 需要升级版本，修改这里的版本号后，执行一下run.sh脚本即可。
VERSION=4.7.5

docker build --build-arg VERSION=$VERSION -t tron:$VERSION .
docker stop tron
docker rm tron
docker run -d --name tron -p 8090:8090 -p 8091:8091 -e JVM_OPTS=-Xmx32g -v /data/tron:/tron --restart=always tron:$VERSION
