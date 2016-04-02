FROM alpine:3.3
MAINTAINER Ryan Paddock <rpaddock@gmail.com>

EXPOSE 8200

ENV VAULT_VERSION 0.5.2
ENV VAULT_ADDR "http://127.0.0.1:8200"

RUN apk add --no-cache --virtual build-deps ca-certificates wget unzip \
    && wget -O /tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
    && unzip /tmp/vault.zip -d /usr/bin \
    && chmod +x /usr/bin/vault \
    && rm /tmp/vault.zip \
    && apk del --force build-deps

ENTRYPOINT ["/usr/bin/vault"]
CMD ["server", "-dev"]
