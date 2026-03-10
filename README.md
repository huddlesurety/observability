# Huddle Observability Stack

This is the central observability stack for the Huddle project, configured to be easily deployed as a **Railway Template**.

## Architecture

The stack consists of 5 tightly integrated services:

1. **OpenTelemetry (OTel) Collector**: The single ingress point for all telemetry data (traces, metrics, logs) from your microservices. It receives data via OTLP (gRPC/HTTP) and routes it to the appropriate backend.
2. **Prometheus**: Time-series database for metrics. Scrapes the OTel Collector to collect metrics.
3. **Tempo**: Distributed tracing backend. Receives traces directly from the OTel Collector via OTLP.
4. **Loki**: Log aggregation system. Receives logs directly from the OTel Collector via OTLP.
5. **Grafana**: Visualization platform. Pre-configured with datasources for Prometheus, Tempo, and Loki to view all telemetry in one place.

## Service Versions

The stack uses the following stable versions (configurable via environment variables):

- **Prometheus**: `v3.5.1`
- **Grafana**: `12.4.1`
- **Loki**: `3.5.11`
- **Tempo**: `2.10.1`
- **OTel Collector**: `0.147.0`

## Deploying on Railway

This repository is optimized for deployment on Railway using its private networking.

1. **Import the repository**: You can drag and drop the `docker-compose.yaml` file into a new or existing Railway project. Railway will automatically scaffold the 5 services, map their volumes, and import their default environment variables.
2. **Networking**: All services use internal DNS (`service-name.railway.internal`). The OTel Collector acts as the ingress, so you should only need to expose the Collector to your applications.
3. **Environment Variables**: All hostnames, ports, and intervals are parameterized. If your Railway service names differ from the defaults (e.g., your Prometheus service gets a domain like `prom-prod.railway.internal`), simply update the corresponding environment variable (like `PROMETHEUS_HOST`) in the Railway dashboard.

## Ingesting Telemetry

Point your applications' OpenTelemetry SDKs to the OTel Collector service.

- **OTLP gRPC**: `http://otel-collector.railway.internal:4317`
- **OTLP HTTP**: `http://otel-collector.railway.internal:4318`

Ensure you route the application network traffic appropriately if the applications are running in a different Railway project or environment.
