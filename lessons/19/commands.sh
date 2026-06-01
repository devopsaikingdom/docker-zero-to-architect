#!/bin/bash
# Lesson 19: OCI Labels: Image Metadata
set -e

docker build -t lesson19 .
docker inspect lesson19 --format '{{json .Config.Labels}}' | python3 -m json.tool
