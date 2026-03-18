#!/bin/sh
set -e

# Substitute env vars into the config template (Prometheus lacks native env expansion)
sed -e "s|\${SCRAPE_INTERVAL}|${SCRAPE_INTERVAL}|g" \
    -e "s|\${EVALUATION_INTERVAL}|${EVALUATION_INTERVAL}|g" \
    /etc/prometheus/config.yaml.tmpl > /etc/prometheus/config.yaml

# --web.listen-address and --storage.tsdb.path are CLI-only in Prometheus (not configurable via config file)
exec prometheus \
  --config.file=/etc/prometheus/config.yaml \
  --storage.tsdb.path=/prometheus \
  --web.enable-remote-write-receiver \
  --web.listen-address="0.0.0.0:${PORT}"
