#!/bin/bash
# Lesson 22: Bind Mounts for Live Development
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

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
