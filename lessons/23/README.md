# Lesson 23: Environment-Based Configuration

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Configure applications through environment variables for different environments.

## 📺 YouTube
**Docker Lesson 23: One Image, Three Environments (12-Factor Config)**

## 💼 LinkedIn Hook
> Same Docker image runs in dev, staging, and production. The only thing that changes? Environment variables. Here's the 12-factor pattern that makes Kubernetes config management easy.

## ⌨️ Commands
```bash
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
```

## 🎙️ Commentary
One image, three environments — just by changing environment variables. This is 12-factor config in action. The Dockerfile sets sensible defaults with ENV. At runtime, `-e` overrides specific vars, and `--env-file` loads from a file. The app reads `os.environ` and behaves accordingly. Same image everywhere — dev, staging, prod — only config changes.

## 🧠 Architect Aside
> In Kubernetes, this pattern becomes ConfigMaps (non-sensitive) and Secrets (sensitive). The app code is identical — it reads env vars. The platform injects different values per environment. If your app reads config from files or hardcoded values, it's not 12-factor and it's going to be painful in K8s.

---
[← Previous](../22/README.md) | [Course Index](../../README.md) | [Next →](../24/README.md)
