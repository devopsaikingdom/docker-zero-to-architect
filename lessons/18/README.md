# Lesson 18: Image Size Comparison and Optimization

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Compare image sizes and learn why size matters for production.

## 📺 YouTube
**Docker Lesson 18: Your Image is 10x Too Big — Here's the Proof**

## 💼 LinkedIn Hook
> 1GB vs 120MB vs 50MB for the same Python app. Here's the size comparison that changed how I think about Docker images in production.

## ⌨️ Commands
```bash
echo 'print("Size comparison demo")' > app.py
docker build -t size-bloated --target bloated .
docker build -t size-optimized --target optimized .
docker build -t size-tiny --target tiny .
echo "=== SIZE COMPARISON ==="
docker images --format '{{.Repository}}:{{.Tag}}\t{{.Size}}' | grep size-
docker system df
docker system df -v | head -20
```

## 🎙️ Commentary
Multi-target builds let you compare approaches. python:3.11 is ~1GB, python:3.11-slim is ~120MB, python:3.11-alpine is ~50MB. `docker system df` shows total disk usage. `docker system df -v` shows per-image breakdown. In production, we set image size budgets — if your image exceeds 200MB, the PR gets flagged for review.

## 🧠 Architect Aside
> At Charter, we set a 200MB soft limit per service image. Any image above that gets reviewed. Why? Because at 100+ microservices, image size multiplied by replica count multiplied by deployment frequency = real infrastructure cost and deployment latency.

---
[← Previous](../17/README.md) | [Course Index](../../README.md) | [Next →](../19/README.md)
