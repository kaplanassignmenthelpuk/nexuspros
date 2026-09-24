#!/bin/sh
cd /workspace || exit 1

if curl -sf http://127.0.0.1:8080/ >/dev/null 2>&1; then
  exit 0
fi

npm run dev >/tmp/nexora-dev.log 2>&1 &
i=0
while [ "$i" -lt 40 ]; do
  if curl -sf http://127.0.0.1:8080/ >/dev/null 2>&1; then
    exit 0
  fi
  i=$((i + 1))
  sleep 0.4
done
exit 0
