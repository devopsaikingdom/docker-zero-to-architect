#!/bin/bash
# Lesson 15: Container Lifecycle: stop, start, rm
set -e

docker run -d --name lifecycle nginx:alpine
docker stop lifecycle
docker start lifecycle
docker restart lifecycle
docker kill lifecycle
docker rm lifecycle
docker container prune -f
