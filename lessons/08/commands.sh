#!/bin/bash
# Lesson 08: CMD vs ENTRYPOINT: The Real Difference
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

docker build -t lesson08 .
docker run lesson08
docker run lesson08 https://httpbin.org/headers
docker run --entrypoint bash -it lesson08
# Compare with CMD-only:
cat > Dockerfile.cmd << 'EOF'
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*
CMD ["curl", "-s", "https://httpbin.org/ip"]
EOF
docker build -t lesson08-cmd -f Dockerfile.cmd .
docker run lesson08-cmd
docker run lesson08-cmd echo "I replaced the entire command"
