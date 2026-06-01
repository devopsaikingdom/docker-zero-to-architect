#!/bin/bash
# Lesson 12: One Image, Many Containers
set -e

docker build -t lesson12 .
docker run -d -p 8081:8080 --name app1 lesson12
docker run -d -p 8082:8080 --name app2 lesson12
curl http://localhost:8081
curl http://localhost:8082
docker stop app1 app2 && docker rm app1 app2
