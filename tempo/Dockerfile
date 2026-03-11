ARG VERSION=2.10.0

FROM grafana/tempo:${VERSION}

USER root

COPY config.yaml /etc/tempo/config.yaml

ENV PORT=3200
ENV OTLP_HTTP_PORT=4318

CMD ["-config.file=/etc/tempo/config.yaml", "-config.expand-env=true"]
