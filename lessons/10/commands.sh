#!/bin/bash
# Lesson 10: Build Cache and .dockerignore
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

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
