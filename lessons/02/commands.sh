#!/bin/bash
# Lesson 02: Interactive Shell Inside a Container
set -e

docker run -it ubuntu bash
# Inside the container:
whoami
hostname
cat /etc/os-release
ls /
ps aux
exit
docker ps -a
