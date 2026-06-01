# Lesson 11: Tagging Images: Versions, Labels, and Best Practices

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Tag images properly for versioning and understand the latest tag trap.

## 📺 YouTube
**Docker Lesson 11: Stop Using 'latest' — Tagging Done Right**

## 💼 LinkedIn Hook
> Using `docker pull myapp:latest` in production? That's a ticking time bomb. Here's the tagging strategy that prevents 'but it worked on my machine' disasters.

## ⌨️ Commands
```bash
docker build -t lesson11:1.0.0 .
docker tag lesson11:1.0.0 lesson11:latest
docker tag lesson11:1.0.0 lesson11:1.0
docker tag lesson11:1.0.0 lesson11:1
docker images lesson11
docker inspect lesson11:1.0.0 | grep -A5 Labels
# All tags point to the same image ID:
docker images --format '{{.Tag}} {{.ID}}' lesson11
```

## 🎙️ Commentary
Tags are just pointers to an image — like git tags. One image can have many tags. The convention: `name:major.minor.patch` (semantic versioning). Create multiple tags: `1.0.0`, `1.0`, `1`, and `latest`. Never use `latest` in production — it's mutable and you won't know what version is running. Always pin to a specific version. LABEL adds metadata — use OCI standard labels for tooling compatibility.

## 🧠 Architect Aside
> In production, 'latest' is not a version — it's a liability. If you deploy `myapp:latest` and something breaks, you can't tell which version is running without inspecting the image. Always use immutable tags (`myapp:1.2.3`) or better yet, the image digest (`myapp@sha256:abc...`). This is a non-negotiable in any serious deployment pipeline.

---
[← Previous](../10/README.md) | [Course Index](../../README.md) | [Next →](../12/README.md)
