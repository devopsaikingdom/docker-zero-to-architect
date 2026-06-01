#!/bin/bash
# Lesson 17: Base Image Choice: Ubuntu vs Alpine
set -e

for base in ubuntu:22.04 debian:bookworm-slim alpine:3.19 python:3.11-slim; do
  docker pull -q $base
  docker images $base --format "{{.Repository}}:{{.Tag}} {{.Size}}"
done
