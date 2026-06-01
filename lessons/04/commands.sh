#!/bin/bash
# Lesson 04: Installing Software with RUN
set -e

docker build -t lesson04 .
docker run -it lesson04
curl --version
wget --version
exit
docker history lesson04
