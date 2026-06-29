#!/bin/sh
echo "Logger starting (wrong way)..."
while true; do
  echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] System check passed" >> /var/log/app.log
  sleep 2
done
