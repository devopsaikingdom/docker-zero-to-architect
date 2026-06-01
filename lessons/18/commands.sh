#!/bin/bash
# Lesson 18: Image Size Comparison and Optimization
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

echo 'print("Size comparison demo")' > app.py
docker build -t size-bloated --target bloated .
docker build -t size-optimized --target optimized .
docker build -t size-tiny --target tiny .
echo "=== SIZE COMPARISON ==="
docker images --format '{{.Repository}}:{{.Tag}}\t{{.Size}}' | grep size-
docker system df
docker system df -v | head -20
