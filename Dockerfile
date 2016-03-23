FROM alpine:3.3
MAINTAINER Ryan Paddock <rpaddock@gmail.com>

EXPOSE 8200

ENV VAULT_VERSION 0.5.2
ENV VAULT_ADDR "http://127.0.0.1:8200"

ADD https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip /tmp/vault.zip
RUN cd /bin && unzip /tmp/vault.zip && chmod +x /bin/vault && rm /tmp/vault.zip

ENTRYPOINT ["/bin/vault"]
CMD ["server", "-dev"]
