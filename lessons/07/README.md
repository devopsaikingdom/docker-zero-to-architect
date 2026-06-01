# Lesson 07: EXPOSE and Port Mapping

## What You'll Learn
Expose ports from a container and map them to the host.

## Commands
```bash
cat > server.py << 'EOF'
from http.server import HTTPServer, SimpleHTTPRequestHandler
import os
class Handler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(f"Hello from container (PID: {os.getpid()})\n".encode())
print("Server starting on port 8080...")
HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()
EOF
docker build -t lesson07 .
docker run -d -p 8080:8080 --name web lesson07
curl http://localhost:8080
docker stop web && docker rm web
```

## Explanation
`EXPOSE` documents which port the container listens on — but it doesn't actually publish anything. It's metadata.

The real magic is `-p host:container`:
- `-p 8080:8080` → host port 8080 maps to container port 8080
- `-p 9090:8080` → host port 9090 maps to container port 8080
- `-d` runs the container in the background (detached)

## Architect Note
> In Kubernetes, ports are defined in the Pod spec, not the Dockerfile. But EXPOSE is still valuable documentation for engineers and tools like docker-compose.

---
[← Previous](../06/) | [Course Index](../../README.md) | [Next →](../08/)
