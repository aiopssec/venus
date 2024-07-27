FROM ubuntu:22.04

ARG VERSION=1.4.12

RUN apt-get update \
  && apt-get install -y net-tools curl unzip \
  && curl -sfL -o /usr/local/bin/geth https://github.com/binance-chain/bsc/releases/download/v${VERSION}/geth_linux \
  && chmod +x /usr/local/bin/geth \
  && curl -sfL -o /tmp/mainnet.zip https://github.com/binance-chain/bsc/releases/download/v${VERSION}/mainnet.zip \
  && unzip /tmp/mainnet.zip -d /etc \
  && rm -f /tmp/mainnet.zip

WORKDIR /bsc
EXPOSE 8545

ADD Entrypoint.sh /Entrypoint
RUN chmod +x /Entrypoint

ENTRYPOINT ["/Entrypoint"]