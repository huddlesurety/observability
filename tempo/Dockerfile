ARG VERSION=2.10.0

FROM grafana/tempo:${VERSION}

USER root

COPY config.yaml /etc/tempo/config.yaml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENV PORT=3200
ENV OTLP_HTTP_PORT=4318

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["-config.file=/etc/tempo/config.yaml", "-config.expand-env=true"]
