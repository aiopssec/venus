#!/usr/bin/env bash

# 需要升级版本，修改这里的版本号后，执行一下run.sh脚本即可。
VERSION=1.4.12

docker build --build-arg VERSION=$VERSION -t bsc:$VERSION .
docker stop bsc
docker rm bsc
docker run --init -d --name bsc -p 8545:8545 -e PRUNE="--diffblock=5000" -v /data/bsc:/bsc --restart=always bsc:$VERSION