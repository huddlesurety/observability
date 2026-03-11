# Trace backend. OTel Collector pushes traces here via OTLP HTTP.
# Grafana queries the HTTP API (PORT) to visualize traces.
# Config uses ${VAR} syntax, enabled by -config.expand-env=true.

ARG VERSION=2.10.0

FROM grafana/tempo:${VERSION}

# Railway volumes mount as root-owned directories
USER root

COPY config.yaml /etc/tempo/config.yaml

# Query/API port (Grafana connects here)
ENV PORT=3200
# OTLP receiver port (OTel Collector pushes here)
ENV OTLP_HTTP_PORT=4318

CMD ["-config.file=/etc/tempo/config.yaml", "-config.expand-env=true"]
