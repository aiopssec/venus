FROM ubuntu:22.04

ARG VERSION=1.29.2

RUN set -ex \
  && apt-get update \
  && apt-get install -y libpq-dev net-tools curl \
  && curl -L https://github.com/MystenLabs/sui/raw/main/crates/sui-config/data/fullnode-template.yaml -o /etc/fullnode.yaml \
  && curl -L https://github.com/MystenLabs/sui-genesis/raw/main/mainnet/genesis.blob -o /etc/genesis.blob \
  && curl -fsSL https://github.com/MystenLabs/sui/releases/download/mainnet-v${VERSION}/sui-mainnet-v${VERSION}-ubuntu-x86_64.tgz -o /tmp/sui.tgz \
  && tar -xzvf /tmp/sui.tgz -C /tmp/ \
  && mv /tmp/sui-* /usr/local/bin/ \
  && chmod +x /usr/local/bin/ \
  && rm -rf /tmp/*

WORKDIR /sui

ADD Entrypoint.sh /Entrypoint
RUN chmod +x /Entrypoint

EXPOSE 9000

ENTRYPOINT ["/Entrypoint"]