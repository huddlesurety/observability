ARG VERSION=3.6.5

FROM grafana/loki:${VERSION}

USER root

COPY config.yaml /etc/loki/config.yaml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENV PORT=3100

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["-config.file=/etc/loki/config.yaml", "-config.expand-env=true"]
