#!/bin/bash
# Lesson 12: One Image, Many Containers
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

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
