# Lesson 07: EXPOSE and Port Mapping

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Expose ports from a container and map them to the host.

## 📺 YouTube
**Docker Lesson 7: EXPOSE Ports — Why -p is the REAL Command**

## 💼 LinkedIn Hook
> EXPOSE in a Dockerfile does absolutely nothing by itself. Here's what actually happens when a container talks to the outside world — and the port mapping pattern you'll use in every project.

## ⌨️ Commands
```bash
cat > server.py << 'EOF'
from http.server import HTTPServer, SimpleHTTPRequestHandler
import os
class Handler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        msg = f"Hello from DevOps AI Kingdom! (PID: {os.getpid()})\n"
        self.wfile.write(msg.encode())
print("Server starting on port 8080...")
HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()
EOF
docker build -t lesson07 .
docker run -d -p 8080:8080 --name web lesson07
curl http://localhost:8080
docker port web
docker stop web && docker rm web
docker run -d -p 9090:8080 --name web2 lesson07
curl http://localhost:9090
docker stop web2 && docker rm web2
```

## 🎙️ Commentary
EXPOSE documents which port the container listens on — but it doesn't actually publish anything. It's metadata. The magic happens with `-p 8080:8080` which maps host port to container port. `-d` runs the container in the background. You can map to any host port: `-p 9090:8080` means 'host 9090 → container 8080.' `docker port` shows the current mapping.

## 🧠 Architect Aside
> EXPOSE is documentation, not configuration. In Kubernetes, you define ports in the Pod spec, not the Dockerfile. But EXPOSE is still valuable — it tells other engineers (and tools like `docker-compose`) what ports the service uses. Always include it.

---
[← Previous](../06/README.md) | [Course Index](../../README.md) | [Next →](../08/README.md)
