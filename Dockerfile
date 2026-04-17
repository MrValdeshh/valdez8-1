FROM gojolvl99/gojo-v2-core:latest

LABEL maintainer="MrValdez"
LABEL description="Cloud Run Xray 8-protocol setup (VLESS, VMess, Trojan, Shadowsocks, WS + HU)"
LABEL version="1.0"

WORKDIR /etc/xray

# Copy the full 8-protocol config
COPY config.json /etc/xray/config.json

# Cloud Run uses only one port
EXPOSE 8080

# Reduce logging and optimize performance
ENV XRAY_LOGLEVEL=warning
ENV XRAY_WORKERS=4

# Start Xray with the config
ENTRYPOINT ["xray"]
CMD ["-config", "/etc/xray/config.json"]
