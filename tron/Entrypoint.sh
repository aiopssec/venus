#!/bin/bash

if [ ! -f /tron/main_net_config.conf ];then
  mv /tmp/main_net_config.conf /tron/main_net_config.conf
  sed -i "s/supportConstant = false/supportConstant = true/" /tron/main_net_config.conf
  sed -i "s/maxTimeRatio = 5.0/maxTimeRatio = 50.0/" /tron/main_net_config.conf
  sed -i "s/# trx.expiration.timeInMilliseconds = 60000/trx.expiration.timeInMilliseconds = 300000/" /tron/main_net_config.conf
  sed -i "s/maxHttpConnectNumber = 50/maxHttpConnectNumber = 5000/" /tron/main_net_config.conf
  echo "node.maxTransactionPendingSize = 5000" >> /tron/main_net_config.conf
fi

java $JVM_OPTS -XX:+UseConcMarkSweepGC -jar /opt/FullNode.jar -c /tron/main_net_config.conf
