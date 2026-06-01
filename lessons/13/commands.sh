#!/bin/bash
# Lesson 13: docker exec: Debug Running Containers
set -e

docker run -d --name debug-me nginx:alpine
docker exec debug-me cat /etc/nginx/nginx.conf
docker exec -it debug-me sh
ps aux
exit
docker stop debug-me && docker rm debug-me
