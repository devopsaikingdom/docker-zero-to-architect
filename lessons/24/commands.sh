#!/bin/bash
# Lesson 24: docker stats: Monitor Resource Usage in Real-Time
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

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
