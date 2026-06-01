#!/bin/bash
# Lesson 05: COPY and WORKDIR
set -e

echo 'print("Hello from DevOps AI Kingdom!")' > hello.py
docker build -t lesson05 .
docker run lesson05
