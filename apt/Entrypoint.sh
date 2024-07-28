#!/bin/bash

if [ ! -f /apt/public_full_node.yaml ];then
    curl -fsSL -o /apt/public_full_node.yaml https://raw.githubusercontent.com/aptos-labs/aptos-core/devnet/config/src/config/test_data/public_full_node.yaml
    curl -fsSL -o /apt/waypoint.txt https://raw.githubusercontent.com/aptos-labs/aptos-networks/main/mainnet/waypoint.txt
    curl -fsSL -o /apt/genesis.blob https://raw.githubusercontent.com/aptos-labs/aptos-networks/main/mainnet/genesis.blob
    sed -i 's/127.0.0.1/0.0.0.0/g' /apt/public_full_node.yaml
    sed -i 's/\/opt\/aptos/\/apt/g' /apt/public_full_node.yaml
fi

aptos-node -f /apt/public_full_node.yaml