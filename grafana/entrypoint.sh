#!/bin/sh
set -e

# Map PORT to Grafana's native env var
export GF_SERVER_HTTP_PORT="${PORT:-3000}"

exec /run.sh "$@"
