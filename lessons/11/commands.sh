#!/bin/bash
# Lesson 11: Tagging Images
set -e

docker build -t lesson11:1.0.0 .
docker tag lesson11:1.0.0 lesson11:latest
docker tag lesson11:1.0.0 lesson11:1.0
docker images lesson11
