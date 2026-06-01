#!/bin/bash
# Lesson 18: Image Size Comparison
set -e

echo 'print("size demo")' > app.py
docker build -t size-bloated --target bloated .
docker build -t size-optimized --target optimized .
docker build -t size-tiny --target tiny .
docker images --format '{{.Repository}}\t{{.Size}}' | grep size-
