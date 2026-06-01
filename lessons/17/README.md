# Lesson 17: Base Image Choice: Ubuntu vs Debian vs Alpine

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Choose the right base image and understand the size/compatibility tradeoffs.

## 📺 YouTube
**Docker Lesson 17: Ubuntu vs Alpine vs Slim — Which Base Image Should You Use?**

## 💼 LinkedIn Hook
> Alpine is 7MB. Ubuntu is 77MB. But choosing Alpine can break your app. Here's the decision framework I use for every production image.

## ⌨️ Commands
```bash
for base in ubuntu:22.04 debian:bookworm-slim alpine:3.19 python:3.11 python:3.11-slim python:3.11-alpine; do
  echo "--- $base ---"
  docker pull -q $base
  docker images $base --format '{{.Repository}}:{{.Tag}} {{.Size}}'
done
docker build -t lesson17 .
docker run lesson17
```

## 🎙️ Commentary
Base image choice is your first architecture decision. Ubuntu (77MB): familiar, lots of packages, good for development. Debian-slim (74MB): smaller, good default for production. Alpine (7MB): tiny, uses musl libc instead of glibc — some Python/Node packages break. Python-slim (120MB): Debian + Python pre-installed. The rule: start with -slim variants for production. Use Alpine only if you test thoroughly. Size matters because smaller = faster pulls = faster autoscaling.

## 🧠 Architect Aside
> At scale, base image size directly impacts autoscaling speed. If your image is 1.2GB and you need to scale from 3 to 30 pods during a traffic spike, that's 30 image pulls. With a 120MB slim image, the pull takes 3 seconds instead of 30. That's the difference between handling the spike and dropping requests. This is why 'image size budget' is an architect concern.

---
[← Previous](../16/README.md) | [Course Index](../../README.md) | [Next →](../18/README.md)
