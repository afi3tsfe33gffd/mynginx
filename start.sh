#!/bin/bash

tmux new-session -d -s 1 "bash -c 'bash <(curl -Ls https://raw.githubusercontent.com/hossinasaadi/quicktunnel/main/install.sh) --yes --no-service --uuid 0264c953-a1e7-43aa-aff0-4337b249a438 --ws-path /api && /usr/local/quicktunnel/lib/run.sh; exec bash'"

echo "Waiting for tunnel hostname..."
for i in $(seq 1 90); do
  STATUS="$(/usr/local/bin/quicktunnel-cli status 2>/dev/null)"
  LINK="$(echo "$STATUS" | grep -oE 'https://[^ "]+' | head -n1)"
  if [ -n "$LINK" ]; then
    break
  fi
  sleep 2
done

echo "=============================="
echo "$STATUS"
echo "Hostname: ${LINK:-not found yet}"
echo "=============================="

exec nginx -g 'daemon off;'
