#!/bin/bash
# Lesson 25: Push to ghcr.io: Your First Registry Push
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

docker build -t lesson25 .
# Login to GitHub Container Registry:
echo $GITHUB_TOKEN | docker login ghcr.io -u devopsaikingdom --password-stdin
# Tag for the registry:
docker tag lesson25 ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
docker tag lesson25 ghcr.io/devopsaikingdom/docker-zero-to-architect:tier1-capstone
# Push:
docker push ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
docker push ghcr.io/devopsaikingdom/docker-zero-to-architect:tier1-capstone
# Verify:
docker pull ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
docker run ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
