#!/bin/bash
# Lesson 24: docker stats: Monitor Resources
set -e

docker run -d --name stress --memory=100m lesson24
docker stats stress --no-stream
docker inspect stress --format '{{.State.OOMKilled}}'
docker rm -f stress
