#!/bin/bash
# Lesson 11: Tagging Images: Versions, Labels, and Best Practices
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

docker build -t lesson11:1.0.0 .
docker tag lesson11:1.0.0 lesson11:latest
docker tag lesson11:1.0.0 lesson11:1.0
docker tag lesson11:1.0.0 lesson11:1
docker images lesson11
docker inspect lesson11:1.0.0 | grep -A5 Labels
# All tags point to the same image ID:
docker images --format '{{.Tag}} {{.ID}}' lesson11
