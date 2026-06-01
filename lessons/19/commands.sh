#!/bin/bash
# Lesson 19: OCI Labels: Image Metadata That Matters
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

docker build -t lesson19 .
docker inspect lesson19 --format '{{json .Config.Labels}}' | python3 -m json.tool
docker images --filter "label=org.opencontainers.image.authors=devopsaikingdom@gmail.com"
