# Lesson 10: Build Cache and .dockerignore

## What You'll Learn
Master the build cache for fast builds and use .dockerignore to keep images clean.

## Commands
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
node_modules
EOF
docker build -t lesson10 .
echo '# comment' >> app.py
docker build -t lesson10 .
```

## Explanation
The most important optimization in Docker:

1. `COPY requirements.txt .` — copy deps file first
2. `RUN pip install` — install deps (cached if requirements.txt unchanged)
3. `COPY . .` — copy source code last

When only code changes, Docker **skips** the slow pip install. This can take builds from 8 minutes to 30 seconds.

`.dockerignore` keeps junk (.git, node_modules, __pycache__) out of the build context.

## Architect Note
> I've seen builds go from 8 minutes to 30 seconds just by fixing COPY order and adding .dockerignore.

---
[← Previous](../09/) | [Course Index](../../README.md) | [Next →](../11/)
