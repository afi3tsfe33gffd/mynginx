FROM debian:12-slim

RUN apt update && apt install -y curl unzip net-tools tmux ca-certificates busybox \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3000
CMD ["/start.sh"]
