# Lesson 17: Base Image Choice: Ubuntu vs Alpine

## What You'll Learn
Choose the right base image for your use case.

## Commands
```bash
for base in ubuntu:22.04 debian:bookworm-slim alpine:3.19 python:3.11-slim; do
  docker pull -q $base
  docker images $base --format "{{.Repository}}:{{.Tag}} {{.Size}}"
done
```

## Explanation
Ubuntu (77MB): familiar. Debian-slim (74MB): good production default. Alpine (7MB): tiny but uses musl libc — some packages break. Start with `-slim` for production. Use Alpine only if tested.

## Architect Note
> Image size impacts autoscaling. 1.2GB = 30s pulls. 120MB = 3s pulls. That's the difference between handling a spike and dropping requests.

---
[← Previous](../16/) | [Course Index](../../README.md) | [Next →](../18/)
