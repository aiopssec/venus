FROM ubuntu:22.04

ARG VERSION=1.16.3

RUN set -ex \
  && apt-get update \
  && apt-get install -y net-tools curl libdw1 \
  && curl -fsSL -o /tmp/apt.tar.gz https://github.com/aptos-labs/aptos-core/releases/download/aptos-node-v${VERSION}/aptos-node-ubuntu-22.04.tgz \
  && tar -zxvf /tmp/apt.tar.gz -C /usr/local/bin/ \
  && chmod +x /usr/local/bin/* \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /apt
ADD Entrypoint.sh /Entrypoint
RUN chmod +x /Entrypoint

EXPOSE 8080

ENTRYPOINT ["/Entrypoint"]