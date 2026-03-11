ARG VERSION=3.6.5

FROM grafana/loki:${VERSION}

USER root

COPY config.yaml /etc/loki/config.yaml

ENV PORT=3100

CMD ["-config.file=/etc/loki/config.yaml", "-config.expand-env=true"]
