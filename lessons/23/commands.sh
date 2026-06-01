#!/bin/bash
# Lesson 23: Environment-Based Configuration
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

cat > config_app.py << 'EOF'
import os, json
from http.server import HTTPServer, SimpleHTTPRequestHandler
config = {k: v for k, v in os.environ.items() if k.startswith(("APP_", "DB_", "LOG_"))}
class H(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type","application/json")
        self.end_headers()
        self.wfile.write(json.dumps(config, indent=2).encode())
print(f"Config: {json.dumps(config)}")
HTTPServer(("0.0.0.0",8080),H).serve_forever()
EOF
docker build -t lesson23 .
# Production:
docker run -d -p 8081:8080 --name prod lesson23
curl -s http://localhost:8081 | python3 -m json.tool
# Staging (override at runtime):
docker run -d -p 8082:8080 -e APP_ENV=staging -e DB_HOST=staging-db.internal -e LOG_LEVEL=DEBUG --name staging lesson23
curl -s http://localhost:8082 | python3 -m json.tool
# From env file:
echo 'APP_ENV=testing' > .env.test
echo 'DB_HOST=test-db' >> .env.test
echo 'LOG_LEVEL=DEBUG' >> .env.test
docker run -d -p 8083:8080 --env-file .env.test --name test lesson23
curl -s http://localhost:8083 | python3 -m json.tool
docker stop prod staging test && docker rm prod staging test
