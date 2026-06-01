#!/bin/bash
# Lesson 15: Container Lifecycle: stop, start, rm
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

docker run -d --name lifecycle nginx:alpine
docker ps
docker stop lifecycle
docker ps
docker ps -a
docker start lifecycle
docker ps
docker restart lifecycle
docker pause lifecycle
docker ps
docker unpause lifecycle
docker kill lifecycle
docker ps -a
docker rm lifecycle
# Remove all stopped containers:
docker container prune -f
# Nuclear option:
docker system prune -f
