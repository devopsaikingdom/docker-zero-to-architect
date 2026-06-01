# Lesson 14: docker logs: Reading Container Output

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
View and follow container logs, and understand stdout/stderr.

## 📺 YouTube
**Docker Lesson 14: Container Logs — The 12-Factor Rule Everyone Breaks**

## 💼 LinkedIn Hook
> If your container writes logs to a file, nobody will ever see them. Here's the one rule that connects Docker logging to Kubernetes observability.

## ⌨️ Commands
```bash
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
```

## 🎙️ Commentary
Containers should write everything to stdout and stderr — that's the contract. `docker logs` reads this output. `--tail 5` shows the last 5 lines. `-f` follows in real-time (like `tail -f`). `--since 30s` filters by time. In this demo, we simulate a microservice logging with different levels. Errors go to stderr, everything else to stdout. This pattern is critical — in production, a log collector (Fluentd, Vector) captures stdout/stderr and ships it to your logging platform.

## 🧠 Architect Aside
> The '12-factor app' rule: never write logs to files inside the container. Write to stdout. Let the platform (Docker, K8s) handle collection. In Kubernetes, kubelet captures stdout → Fluentd/Vector ships to Loki/ELK. If you write to files, nobody sees them. This is one of the most common mistakes I fix in production.

---
[← Previous](../13/README.md) | [Course Index](../../README.md) | [Next →](../15/README.md)
