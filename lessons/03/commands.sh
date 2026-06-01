#!/bin/bash
# Lesson 03: Your First Dockerfile
set -e

cat Dockerfile
docker build -t my-first-image .
docker run my-first-image
docker images | grep my-first-image
docker history my-first-image
