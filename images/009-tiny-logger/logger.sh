#!/bin/sh
log_info()  { echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO]  $1"; }
log_warn()  { echo "$(date '+%Y-%m-%d %H:%M:%S') [WARN]  $1" >&2; }
log_error() { echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $1" >&2; }

log_info "tiny-logger starting up"
log_info "DevOps AI Kingdom logger v1.0"

COUNTER=0
while true; do
  COUNTER=$((COUNTER + 1))
  log_info "Heartbeat #${COUNTER} â�� system nominal"

  if [ $((COUNTER % 5)) -eq 0 ]; then
    log_warn "Memory usage above 70% (simulated)"
  fi

  if [ $((COUNTER % 12)) -eq 0 ]; then
    log_error "Connection timeout to upstream (simulated)"
  fi

  sleep 3
done
