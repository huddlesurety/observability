# Entry point for all telemetry. Microservices push OTLP here.
# Routes: metrics -> Prometheus exporter, traces -> Tempo, logs -> Loki.
# Config uses ${env:VAR} syntax (native OTel Collector env expansion).

FROM otel/opentelemetry-collector:0.147.0

COPY config.yaml /etc/config.yaml

ENV OTLP_HTTP_PORT=4318
# Prometheus scrapes this port for metrics
ENV PROMETHEUS_EXPORTER_PORT=8889
ENV HEALTH_CHECK_PORT=13133
ENV TEMPO_ENDPOINT=http://tempo.railway.internal:4318
# Loki serves OTLP on /otlp under its main HTTP server
ENV LOKI_ENDPOINT=http://loki.railway.internal:3100/otlp

EXPOSE ${OTLP_HTTP_PORT} ${PROMETHEUS_EXPORTER_PORT} ${HEALTH_CHECK_PORT}

CMD ["--config=/etc/config.yaml"]
