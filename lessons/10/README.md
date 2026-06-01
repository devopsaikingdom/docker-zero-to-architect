# Lesson 10: Build Cache and .dockerignore

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Master the build cache for fast builds and use .dockerignore to keep images clean.

## 📺 YouTube
**Docker Lesson 10: The Build Cache Trick That Makes Builds 10x Faster**

## 💼 LinkedIn Hook
> My builds went from 8 minutes to 30 seconds with ONE change to the Dockerfile. Here's the COPY order pattern that every production Docker image uses.

## ⌨️ Commands
```bash
mkdir -p app && cd app
echo 'flask==3.0.0' > requirements.txt
cat > app.py << 'EOF'
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "DevOps AI Kingdom - Build Cache Demo"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF
cat > .dockerignore << 'EOF'
.git
__pycache__
*.pyc
.env
.venv
node_modules
*.md
Dockerfile
.dockerignore
EOF
docker build -t lesson10 .
# Now change only app.py:
echo '# comment' >> app.py
docker build -t lesson10 .
# Notice: requirements install is CACHED!
docker run -d -p 5000:5000 --name flask-app lesson10
curl http://localhost:5000
docker stop flask-app && docker rm flask-app
```

## 🎙️ Commentary
This is the most important optimization pattern in Docker. Notice the order: COPY requirements.txt first, install dependencies, THEN copy the rest of the code. Why? Because dependencies change rarely but code changes every commit. By copying requirements.txt first, Docker caches the pip install layer. When only app.py changes, it skips the slow dependency install. The .dockerignore file keeps junk out of the build context — without it, Docker sends your entire directory (including .git, node_modules, etc.) to the daemon, slowing builds massively.

## 🧠 Architect Aside
> I've seen builds go from 8 minutes to 30 seconds just by fixing COPY order and adding .dockerignore. In CI/CD pipelines where you build on every commit, this saves hours per week across a team. The .dockerignore should be as strict as .gitignore — exclude everything that isn't needed at runtime.

---
[← Previous](../09/README.md) | [Course Index](../../README.md) | [Next →](../11/README.md)
