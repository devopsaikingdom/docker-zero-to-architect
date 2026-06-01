# Lesson 24: docker stats: Monitor Resource Usage in Real-Time

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Monitor container CPU and memory usage with docker stats.

## 📺 YouTube
**Docker Lesson 24: docker stats — Watch Your Container Get OOMKilled**

## 💼 LinkedIn Hook
> What happens when a container uses more memory than allowed? It gets killed. Here's how `docker stats` and `--memory` limits work — and why this matters in Kubernetes.

## ⌨️ Commands
```bash
cat > stress.py << 'EOF'
import time, os
data = []
print(f"PID: {os.getpid()} - Starting stress test")
for i in range(50):
    data.append("x" * 1024 * 1024)  # 1MB per iteration
    print(f"Memory allocated: ~{len(data)}MB")
    time.sleep(0.5)
print("Done. Holding memory...")
time.sleep(3600)
EOF
docker build -t lesson24 .
docker run -d --name stress --memory=100m lesson24
docker stats stress --no-stream
docker stats --no-stream --format "table {{.Name}}	{{.CPUPerc}}	{{.MemUsage}}	{{.MemPerc}}"
# Watch it hit the memory limit:
docker logs -f stress
# It will be OOMKilled:
docker inspect stress --format '{{.State.OOMKilled}}'
docker rm -f stress
# With proper limits:
docker run -d --name limited --memory=200m --cpus=0.5 lesson24
docker stats limited --no-stream
docker rm -f limited
```

## 🎙️ Commentary
docker stats is your real-time resource monitor — CPU, memory, network, disk I/O per container. `--no-stream` gives a snapshot. `--format` customizes the output. The critical demo: we set `--memory=100m` and run a process that allocates more than that. Docker kills it (OOMKilled). This is exactly what happens in Kubernetes when a pod exceeds its memory limit. Understanding resource limits here prevents production outages.

## 🧠 Architect Aside
> In Kubernetes, resource requests and limits map directly to Docker's `--memory` and `--cpus`. If you don't set limits, one pod can eat all node resources and starve others. OOMKill in Docker = OOMKill in K8s. The pattern: set requests to typical usage, limits to max burst. We'll define this precisely in the K8s module.

---
[← Previous](../23/README.md) | [Course Index](../../README.md) | [Next →](../25/README.md)
