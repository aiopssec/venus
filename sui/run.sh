#!/bin/bash

VERSION=1.29.2

docker build --build-arg VERSION=$VERSION -t sui:$VERSION .
docker stop sui
docker rm sui
docker run --init -d --name sui -p 9000:9000 --cpus=24 -m 96G -v /data/sui:/sui --restart=always sui:$VERSION