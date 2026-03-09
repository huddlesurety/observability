#!/bin/sh
set -e

sed -e "s|\${OTEL_COLLECTOR_HOST}|${OTEL_COLLECTOR_HOST}|g" \
    -e "s|\${OTEL_COLLECTOR_PORT}|${OTEL_COLLECTOR_PORT}|g" \
    -e "s|\${SCRAPE_INTERVAL}|${SCRAPE_INTERVAL}|g" \
    -e "s|\${EVALUATION_INTERVAL}|${EVALUATION_INTERVAL}|g" \
    /etc/prometheus/config.yaml.tmpl > /etc/prometheus/config.yaml

exec prometheus \
  --config.file=/etc/prometheus/config.yaml \
  --storage.tsdb.path=/prometheus
