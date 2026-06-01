# Lesson 22: Bind Mounts for Development

## What You'll Learn
Edit code on host, see changes instantly in container.

## Commands
```bash
cat > app.py << 'EOF'
from flask import Flask
app = Flask(__name__)
@app.route("/")
def home(): return "<h1>Edit me!</h1>"
EOF
docker build -t lesson22 .
docker run -d -p 5000:5000 -v $(pwd):/app --name dev lesson22
curl http://localhost:5000
docker stop dev && docker rm dev
```

## Explanation
Bind mounts map a host directory into the container. Combined with hot-reload, code changes appear instantly. Dev only — never use in production.

## Architect Note
> Production = image builds. Dev = bind mounts for speed. Never confuse the two.

---
[← Previous](../21/) | [Course Index](../../README.md) | [Next →](../23/)
