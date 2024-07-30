## SUI

### 部署
```
./run.sh
```

* 快照下载, 全节点包含索引数据, 进入容器用sui-tool工具下载
```
nohup sui-tool download-db-snapshot --latest \
    --network mainnet --path /sui/snapshot/ \
    --num-parallel-downloads 25 \
    --no-sign-request & 
```

---
- [快照文档](https://docs.sui.io/guides/operator/snapshots#restoring-using-rocksdb-snapshots)