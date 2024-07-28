#!/usr/bin/env bash

# 需要升级版本，修改这里的版本号后，执行一下run.sh脚本即可。
VERSION=1.16.3

docker build --build-arg VERSION=$VERSION -t apt:$VERSION .
docker stop apt
docker rm apt
docker run --init -d --name apt -p 8080:8080 -v /data/apt:/apt --restart=always apt:$VERSION