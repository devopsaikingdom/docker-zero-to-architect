#!/bin/bash
# Lesson 17: Base Image Choice: Ubuntu vs Debian vs Alpine
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

for base in ubuntu:22.04 debian:bookworm-slim alpine:3.19 python:3.11 python:3.11-slim python:3.11-alpine; do
  echo "--- $base ---"
  docker pull -q $base
  docker images $base --format '{{.Repository}}:{{.Tag}} {{.Size}}'
done
docker build -t lesson17 .
docker run lesson17
