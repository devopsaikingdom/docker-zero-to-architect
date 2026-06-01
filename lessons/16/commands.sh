#!/bin/bash
# Lesson 16: docker inspect: X-Ray Any Container
set -e

docker run -d --name inspect-me -p 8080:80 nginx:alpine
docker inspect inspect-me --format '{{.NetworkSettings.IPAddress}}'
docker inspect inspect-me --format '{{json .Config.Env}}' | python3 -m json.tool
docker stop inspect-me && docker rm inspect-me
