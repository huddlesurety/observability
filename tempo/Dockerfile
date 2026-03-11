ARG VERSION=2.10.0

FROM grafana/tempo:${VERSION}

USER root

COPY config.yaml /etc/tempo/config.yaml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["-config.file=/etc/tempo/config.yaml"]
