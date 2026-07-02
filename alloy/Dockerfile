FROM grafana/alloy:latest

WORKDIR /etc/alloy

COPY config.alloy /etc/alloy/config.alloy

EXPOSE 12345 4318

ENTRYPOINT ["alloy", "run", "--server.http.listen-addr=0.0.0.0:12345", "/etc/alloy/config.alloy"]
