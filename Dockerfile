FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

ENV VAULT_VERSION="1.8.3"

LABEL name="Hashicorp Vault Client" \
      build-date="2021-10-13" \
      version=$VAULT_VERSION \
      release="1"

USER root

RUN microdnf -y update \
    && microdnf -y install unzip wget \
    && microdnf -y clean all \
    && rm -rf /var/cache/yum

RUN wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
    chmod +x ./vault && \
    mv ./vault /usr/bin/vault

USER 1001
