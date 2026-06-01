#!/bin/bash
# Lesson 08: CMD vs ENTRYPOINT
set -e

docker build -t lesson08 .
docker run lesson08
docker run lesson08 https://httpbin.org/headers
docker run --entrypoint bash -it lesson08
