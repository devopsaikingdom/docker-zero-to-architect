#!/bin/bash
# Lesson 16: docker inspect: X-Ray Any Container or Image
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

docker run -d --name inspect-me -p 8080:80 -e MY_VAR=hello -v /tmp/data:/data nginx:alpine
docker inspect inspect-me
docker inspect inspect-me --format '{{.State.Status}}'
docker inspect inspect-me --format '{{.NetworkSettings.IPAddress}}'
docker inspect inspect-me --format '{{json .Config.Env}}' | python3 -m json.tool
docker inspect inspect-me --format '{{range .Mounts}}{{.Source}} -> {{.Destination}}{{end}}'
docker inspect nginx:alpine --format '{{.Config.ExposedPorts}}'
docker stop inspect-me && docker rm inspect-me
