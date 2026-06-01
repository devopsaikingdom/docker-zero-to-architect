#!/bin/bash
# Lesson 25: Push to ghcr.io: First Registry Push
set -e

docker build -t lesson25 .
echo $GITHUB_TOKEN | docker login ghcr.io -u devopsaikingdom --password-stdin
docker tag lesson25 ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
docker push ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
