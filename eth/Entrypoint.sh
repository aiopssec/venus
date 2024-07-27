#!/bin/bash

if [ ! -d /eth/beacon ];then
  mkdir /eth/beacon
fi

nohup geth --datadir /eth --http --http.addr 0.0.0.0 --http.api web3,eth,net,personal,admin --authrpc.addr 0.0.0.0 --authrpc.jwtsecret /eth/jwt.txt --cache 8192 --gpo.blocks 20 --gpo.percentile 95 --gpo.maxprice 1000000000000 --txpool.accountqueue 1000 --txpool.globalqueue 20000 --txpool.accountslots 160 --txpool.globalslots 20000 --txpool.lifetime 6h0m0s --txpool.pricebump 1 --allow-insecure-unlock --http.vhosts=* --ws --ws.addr 0.0.0.0 --ws.api web3,eth --ws.origins '*' > /eth/geth.log 2>&1 &

sleep 3

beacon-chain --accept-terms-of-use --datadir=/eth/beacon --rpc-host=0.0.0.0 --monitoring-host=0.0.0.0 --execution-endpoint=http://127.0.0.1:8551 --jwt-secret=/eth/jwt.txt --grpc-gateway-host=0.0.0.0