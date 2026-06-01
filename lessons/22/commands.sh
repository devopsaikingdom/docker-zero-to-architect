#!/bin/bash
# Lesson 22: Bind Mounts for Development
set -e

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
