#!/bin/bash
# Lesson 20: A Static Website with Nginx
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

cat > index.html << 'EOF'
<!DOCTYPE html>
<html><head><title>DevOps AI Kingdom</title>
<style>body{font-family:sans-serif;background:#0a0e17;color:#e2e8f0;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{text-align:center;padding:3rem;border:1px solid #1e293b;border-radius:16px;background:#1a2332}
h1{background:linear-gradient(135deg,#00d4ff,#a855f7);-webkit-background-clip:text;-webkit-text-fill-color:transparent}
</style></head>
<body><div class="card"><h1>DevOps AI Kingdom</h1><p>From Zero to Architect</p><p>Container: $(hostname)</p></div></body></html>
EOF
cat > nginx.conf << 'EOF'
server {
    listen 80;
    server_name localhost;
    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
    location /health {
        return 200 'healthy';
        add_header Content-Type text/plain;
    }
}
EOF
docker build -t lesson20 .
docker run -d -p 8080:80 --name kingdom-site lesson20
curl http://localhost:8080
curl http://localhost:8080/health
docker inspect lesson20 --format '{{json .Config.Healthcheck}}' | python3 -m json.tool
docker stop kingdom-site && docker rm kingdom-site
