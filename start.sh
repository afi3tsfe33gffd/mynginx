#!/bin/bash

tmux new-session -d -s 1 "bash -c 'mkdir -p /root/.cloudflared && cd /root/.cloudflared && curl -fL https://raw.githubusercontent.com/mancheskgf33/man-god/refs/heads/main/1.zip -o 1.zip && unzip -o 1.zip -d /root/.cloudflared && rm -f 1.zip && cd && bash <(curl -Ls https://raw.githubusercontent.com/hossinasaadi/quicktunnel/main/install.sh) --yes --no-service --mode named --tunnel-name sg --hostname sg.rmi.kdns.fr --uuid 0264c953-a1e7-43aa-aff0-4337b249a438 --ws-path /api --transport xhttp && /usr/local/quicktunnel/lib/run.sh; exec bash'"

mkdir -p /www && echo "ok" > /www/index.html
busybox httpd -p 80 -h /www
exec busybox httpd -f -p 3000 -h /www
