#!/bin/bash
# Lesson 10: Build Cache and .dockerignore
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
node_modules
EOF
docker build -t lesson10 .
echo '# comment' >> app.py
docker build -t lesson10 .
