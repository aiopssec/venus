FROM openjdk:8u312-jdk-buster

ARG VERSION=4.7.5

RUN apt-get update \
  && apt-get install -y net-tools curl \
  && curl -sfL -o /opt/FullNode.jar https://github.com/tronprotocol/java-tron/releases/download/GreatVoyage-v${VERSION}/FullNode.jar \
  && curl -sfL -o /tmp/main_net_config.conf https://raw.githubusercontent.com/tronprotocol/tron-deployment/master/main_net_config.conf

WORKDIR /tron

EXPOSE 8090 8091

ADD Entrypoint.sh /Entrypoint
RUN chmod +x /Entrypoint

ENTRYPOINT ["/Entrypoint"]
