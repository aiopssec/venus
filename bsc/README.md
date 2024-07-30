## BSC

### 部署
* 环境变量`PRUNE` 为需要保留的区块数
```
./run
```

### 添加peer节点(可选)
```
curl -X POST -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"admin_addPeer","params":[""],"id":1 }' http://localhost:8545
```

---
* [快照下载](https://github.com/bnb-chain/bsc-snapshots)
* [快照下载](https://github.com/48Club/bsc-snapshots)
* [bsc peer节点](https://api.binance.org/v1/discovery/peers)
