#!/bin/sh
set -e

GETH_DIR="/geth"

if [ ! -f "/config/genesis.json" ]; then
  echo "Downloading genesis file..."
  wget -P /config https://raw.githubusercontent.com/celo-org/celo-l2-node-docker-compose/refs/heads/main/envs/mainnet/config/genesis.json
fi

if [ ! -f "/config/rollup.json" ]; then
  echo "Downloading rollup file..."
  wget -P /config https://raw.githubusercontent.com/celo-org/celo-l2-node-docker-compose/refs/heads/main/envs/mainnet/config/rollup.json
fi

# Create JWT if it doesn't exist
if [ ! -f "/config/jwt.txt" ]; then
  echo "Creating JWT..."
  dd bs=1 count=32 if=/dev/urandom of=/dev/stdout | xxd -p -c 32 > /config/jwt.txt
fi

# Init genesis if it's a custom chain and the datadir is empty
if [ -z "$(ls -A "$GETH_DIR")" ]; then
  echo "Initializing custom chain genesis..."
  if [ ! -f /config/genesis.json ]; then
    echo "Missing genesis.json file: Either update the repo to pull the published genesis.json or migrate your Celo L1 datadir to generate genesis.json."
    exit
  fi
  geth init --datadir="$GETH_DIR" /config/genesis.json
fi

# Start op-geth.
exec geth \
  --datadir="$GETH_DIR" \
  --http \
  --http.corsdomain="*" \
  --http.vhosts="*" \
  --http.addr=0.0.0.0 \
  --http.port=8545 \
  --http.api=web3,debug,eth,txpool,net,engine \
  --syncmode="snap" \
  --gcmode="full" \
  --authrpc.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --authrpc.port=8551 \
  --authrpc.jwtsecret=/config/jwt.txt \
  --rollup.sequencerhttp="https://cel2-sequencer.celo.org" \
  --rollup.disabletxpoolgossip=true \
  --snapshot=true \
  --history.transactions=0 \
  --bootnodes="enode://28f4fcb7f38c1b012087f7aef25dcb0a1257ccf1cdc4caa88584dc25416129069b514908c8cead5d0105cb0041dd65cd4ee185ae0d379a586fb07b1447e9de38@34.169.39.223:30303,enode://a9077c3e030206954c5c7f22cc16a32cb5013112aa8985e3575fadda7884a508384e1e63c077b7d9fcb4a15c716465d8585567f047c564ada2e823145591e444@34.169.212.31:30303,enode://029b007a7a56acbaa8ea50ec62cda279484bf3843fae1646f690566f784aca50e7d732a9a0530f0541e5ed82ba9bf2a4e21b9021559c5b8b527b91c9c7a38579@34.82.139.199:30303,enode://f3c96b73a5772c5efb48d5a33bf193e58080d826ba7f03e9d5bdef20c0634a4f83475add92ab6313b7a24aa4f729689efb36f5093e5d527bb25e823f8a377224@34.82.84.247:30303,enode://daa5ad65d16bcb0967cf478d9f20544bf1b6de617634e452dff7b947279f41f408b548261d62483f2034d237f61cbcf92a83fc992dbae884156f28ce68533205@34.168.45.168:30303,enode://c79d596d77268387e599695d23e941c14c220745052ea6642a71ef7df31a13874cb7f2ce2ecf5a8a458cfc9b5d9219ce3e8bc6e5c279656177579605a5533c4f@35.247.32.229:30303,enode://4151336075dd08eb6c75bfd63855e8a4bd6fd0f91ae4a81b14930f2671e16aee55495c139380c16e1094a49691875e69e40a3a5e2b4960c7859e7eb5745f9387@35.205.149.224:30303,enode://ab999db751265c714b171344de1972ed74348162de465a0444f56e50b8cfd048725b213ba1fe48c15e3dfb0638e685ea9a21b8447a54eb2962c6768f43018e5c@34.79.3.199:30303,enode://9d86d92fb38a429330546fe1aefce264e1f55c5d40249b63153e7df744005fa3c1e2da295e307041fd30ab1c618715f362c932c28715bc20bed7ae4fc76dea81@34.77.144.164:30303,enode://c82c31f21dd5bbb8dc35686ff67a4353382b4017c9ec7660a383ccb5b8e3b04c6d7aefe71203e550382f6f892795728570f8190afd885efcb7b78fa398608699@34.76.202.74:30303,enode://3bad5f57ad8de6541f02e36d806b87e7e9ca6d533c956e89a56b3054ae85d608784f2cd948dc685f7d6bbd5a2f6dd1a23cc03e529ea370dd72d880864a2af6a3@104.199.93.87:30303,enode://1decf3b8b9a0d0b8332d15218f3bf0ceb9606b0efe18f352c51effc14bbf1f4f3f46711e1d460230cb361302ceaad2be48b5b187ad946e50d729b34e463268d2@35.240.26.148:30303