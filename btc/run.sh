#!/usr/bin/env bash

# 需要升级版本，修改这里的版本号后，执行一下run.sh脚本即可。
VERSION=27.1

docker build --build-arg VERSION=$VERSION -t btc:$VERSION .
docker stop btc
docker rm btc
docker run -d --name btc -p 8332:8332 -e RPC_USER=test -e RPC_PASSWD=test -v /data/btc:/btc --restart=always btc:$VERSION