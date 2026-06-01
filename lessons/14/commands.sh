#!/bin/bash
# Lesson 14: docker logs: Reading Container Output
set -e

docker build -t lesson14 .
docker run -d --name logger lesson14
docker logs logger --tail 5
docker logs logger -f
docker logs logger --since 30s
docker stop logger && docker rm logger
