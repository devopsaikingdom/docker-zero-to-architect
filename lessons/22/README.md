# Lesson 22: Bind Mounts for Live Development

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Use bind mounts to edit code on your host and see changes instantly in the container.

## 📺 YouTube
**Docker Lesson 22: Live Code Editing Inside Containers (Bind Mounts)**

## 💼 LinkedIn Hook
> Rebuilding your image after every code change? Stop. Bind mounts let you edit on your laptop and see changes instantly in the container. Here's the dev workflow.

## ⌨️ Commands
```bash
mkdir -p dev-app && cd dev-app
cat > app.py << 'EOF'
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>DevOps AI Kingdom</h1><p>Edit me — I auto-reload!</p>"
EOF
docker build -t lesson22 .
docker run -d -p 5000:5000 -v $(pwd):/app --name dev lesson22
curl http://localhost:5000
# Now edit the file on your host:
sed -i '' 's/Edit me/LIVE EDITING WORKS/' app.py 2>/dev/null || sed -i 's/Edit me/LIVE EDITING WORKS/' app.py
sleep 2
curl http://localhost:5000
docker stop dev && docker rm dev
```

## 🎙️ Commentary
Bind mounts map a HOST directory directly into the container. Unlike volumes, you control the host path. Combined with Flask's --reload flag, code changes on your laptop appear instantly in the container. This is the standard local development workflow: code on your machine, run in a container. No need to rebuild the image for every code change.

## 🧠 Architect Aside
> Bind mounts are for development ONLY. In production, use named volumes or ConfigMaps. Why? Bind mounts depend on host paths, which breaks portability. The production pattern: build a new image with code changes → deploy. Bind mounts = dev speed. Image builds = prod safety.

---
[← Previous](../21/README.md) | [Course Index](../../README.md) | [Next →](../23/README.md)
