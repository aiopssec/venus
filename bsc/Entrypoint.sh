#!/bin/bash

if [ ! -f /bsc/genesis.json ];then
  cp /etc/genesis.json /bsc/genesis.json
fi

geth --identity bsc --config /etc/config.toml --datadir /bsc --http --http.addr 0.0.0.0 --http.vhosts=* --http.api web3,eth,net,debug,personal,txpool --cache 8192 --maxpeers 100 --rpc.allow-unprotected-txs --txpool.reannouncetime 5m --history.transactions 0 --syncmode=full --tries-verify-mode=none --db.engine=pebble --pruneancient=true $PRUNE