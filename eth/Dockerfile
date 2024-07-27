FROM golang:1.22.0-bookworm as builder

ARG VERSION=1.14.7

RUN git clone https://github.com/ethereum/go-ethereum.git \
  && cd go-ethereum \
  && git checkout tags/v${VERSION} \
  && make geth

FROM ubuntu:22.04

COPY --from=builder /go/go-ethereum/build/bin/* /usr/local/bin/

ARG BEACON_VERSION=5.0.4

RUN apt-get update \
  && apt-get install -y net-tools curl \
  && curl -o /usr/local/bin/beacon-chain -fsSL https://github.com/prysmaticlabs/prysm/releases/download/v${BEACON_VERSION}/beacon-chain-v${BEACON_VERSION}-linux-amd64 \
  && chmod +x /usr/local/bin/beacon-chain \
  && rm -rf /var/lib/apt/lists/*

HEALTHCHECK CMD netstat -tlnp | grep 8545 || exit 1
WORKDIR /eth
EXPOSE 3500 8545 8546
ADD Entrypoint.sh /Entrypoint
RUN chmod +x /Entrypoint

ENTRYPOINT ["/Entrypoint"]