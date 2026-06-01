#!/bin/bash
# Lesson 20: Static Website with Nginx
set -e

echo '<h1>DevOps AI Kingdom</h1>' > index.html
docker build -t lesson20 .
docker run -d -p 8080:80 --name site lesson20
curl http://localhost:8080
docker stop site && docker rm site
