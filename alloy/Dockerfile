FROM grafana/alloy:latest

WORKDIR /etc/alloy

COPY config.alloy /etc/alloy/config.alloy

EXPOSE 12345 4318

ENTRYPOINT ["alloy", "run", "/etc/alloy/config.alloy"]
