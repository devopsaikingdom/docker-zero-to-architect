# Lesson 12: One Image, Many Containers

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Run multiple containers from a single image and understand isolation.

## 📺 YouTube
**Docker Lesson 12: 1 Image → 3 Containers (This is How Scaling Works)**

## 💼 LinkedIn Hook
> The moment Docker clicked for me: running 3 copies of the same image, each with its own identity. This is exactly what Kubernetes does — here's the manual version.

## ⌨️ Commands
```bash
cat > server.py << 'EOF'
from http.server import HTTPServer, SimpleHTTPRequestHandler
import os, socket
class H(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type","text/plain")
        self.end_headers()
        self.wfile.write(f"Host: {socket.gethostname()} PID: {os.getpid()}\n".encode())
HTTPServer(("0.0.0.0",8080),H).serve_forever()
EOF
docker build -t lesson12 .
docker run -d -p 8081:8080 --name app1 lesson12
docker run -d -p 8082:8080 --name app2 lesson12
docker run -d -p 8083:8080 --name app3 lesson12
curl http://localhost:8081
curl http://localhost:8082
curl http://localhost:8083
# Each has different hostname!
docker ps
docker stop app1 app2 app3 && docker rm app1 app2 app3
```

## 🎙️ Commentary
One image, three containers — each with its own hostname, PID namespace, and network. This is the foundation of horizontal scaling. Each curl returns a different hostname because each container thinks it's a separate machine. In Kubernetes, this is exactly how a Deployment with 3 replicas works — same image, multiple isolated instances.

## 🧠 Architect Aside
> This is the mental model for Kubernetes ReplicaSets. When you set `replicas: 3`, K8s creates 3 containers from one image, each isolated. A load balancer distributes traffic across them. What we just did manually is what K8s automates.

---
[← Previous](../11/README.md) | [Course Index](../../README.md) | [Next →](../13/README.md)
