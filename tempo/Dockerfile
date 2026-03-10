ARG VERSION=2.10.0

FROM grafana/tempo:${VERSION}

COPY config.yaml /etc/tempo/config.yaml

CMD ["-config.file=/etc/tempo/config.yaml"]
