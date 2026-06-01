#!/bin/bash
# Lesson 14: docker logs: Reading Container Output
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

cat > logger.py << 'EOF'
import time, sys, random
services = ["auth", "gateway", "accounts", "fraud"]
levels = ["INFO", "WARN", "ERROR"]
while True:
    svc = random.choice(services)
    lvl = random.choices(levels, weights=[80,15,5])[0]
    print(f"[{time.strftime('%H:%M:%S')}] [{lvl}] [{svc}] Request processed", flush=True)
    if lvl == "ERROR":
        print(f"[{time.strftime('%H:%M:%S')}] [{lvl}] [{svc}] Stack trace: connection refused", file=sys.stderr, flush=True)
    time.sleep(0.5)
EOF
docker build -t lesson14 .
docker run -d --name logger lesson14
docker logs logger
docker logs logger --tail 5
docker logs logger -f
# Ctrl+C to stop following
docker logs logger --since 30s
docker logs logger 2>/dev/null | grep ERROR
docker stop logger && docker rm logger
