#!/bin/bash

tmux new-session -d -s 1 "bash -c 'bash <(curl -Ls https://raw.githubusercontent.com/hossinasaadi/quicktunnel/main/install.sh) --yes --no-service --uuid 0264c953-a1e7-43aa-aff0-4337b249a438 --ws-path /api && /usr/local/quicktunnel/lib/run.sh; exec bash'"

mkdir -p /www && echo "ok" > /www/index.html
busybox httpd -p 80 -h /www
exec busybox httpd -f -p 3000 -h /www
