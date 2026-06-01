#!/bin/bash
# Lesson 13: docker exec: Look Inside Running Containers
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

docker run -d --name debug-me nginx:alpine
docker exec debug-me cat /etc/nginx/nginx.conf
docker exec debug-me ls -la /usr/share/nginx/html/
docker exec -it debug-me sh
# Inside:
ps aux
df -h
cat /proc/1/cmdline | tr '\0' ' '
exit
docker exec debug-me env
docker logs debug-me
docker stop debug-me && docker rm debug-me
