#!/bin/bash
# Lesson 06: ENV and ARG: Build-Time vs Runtime Config
set -e

cat > app.py << 'EOF'
import os
print(f"App: {os.environ.get('APP_NAME')}")
print(f"Version: {os.environ.get('APP_VERSION')}")
print(f"Environment: {os.environ.get('APP_ENV')}")
EOF
docker build -t lesson06 .
docker run lesson06
docker build -t lesson06:v2 --build-arg APP_VERSION=2.0.0 .
docker run lesson06:v2
docker run -e APP_ENV=staging lesson06
