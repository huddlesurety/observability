# Log backend. OTel Collector pushes logs here via OTLP HTTP.
# Unlike Tempo, Loki serves OTLP on the same port as its query API (PORT at /otlp).
# Config uses ${VAR} syntax, enabled by -config.expand-env=true.

ARG VERSION=3.6.5

FROM grafana/loki:${VERSION}

# Railway volumes mount as root-owned directories
USER root

COPY config.yaml /etc/loki/config.yaml

ENV PORT=3100

CMD ["-config.file=/etc/loki/config.yaml", "-config.expand-env=true"]
