#!/bin/bash
# Lesson 05: COPY and WORKDIR
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

echo 'print("Hello from DevOps AI Kingdom!")' > hello.py
cat Dockerfile
docker build -t lesson05 .
docker run lesson05
docker run -it lesson05 pwd
docker run -it lesson05 ls -la
