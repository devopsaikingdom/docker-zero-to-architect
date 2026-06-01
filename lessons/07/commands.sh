#!/bin/bash
# Lesson 07: EXPOSE and Port Mapping
set -e

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
