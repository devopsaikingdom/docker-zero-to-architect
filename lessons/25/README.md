# Lesson 25: Push to ghcr.io: Your First Registry Push

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Push an image to GitHub Container Registry — the real deployment workflow.

## 📺 YouTube
**Docker Lesson 25: Push Your First Image to a Real Registry (ghcr.io)**

## 💼 LinkedIn Hook
> Tier 1 complete. Your image isn't on your laptop anymore — it's in a real container registry, pullable by anyone. This is how production deployments actually work.

## ⌨️ Commands
```bash
docker build -t lesson25 .
# Login to GitHub Container Registry:
echo $GITHUB_TOKEN | docker login ghcr.io -u devopsaikingdom --password-stdin
# Tag for the registry:
docker tag lesson25 ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
docker tag lesson25 ghcr.io/devopsaikingdom/docker-zero-to-architect:tier1-capstone
# Push:
docker push ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
docker push ghcr.io/devopsaikingdom/docker-zero-to-architect:tier1-capstone
# Verify:
docker pull ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
docker run ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
```

## 🎙️ Commentary
This is the capstone of Tier 1. Until now, images lived only on your machine. Now we push to a real registry — GitHub Container Registry (ghcr.io). The workflow: build → tag with registry prefix → login → push. The tag format is `ghcr.io/OWNER/REPO:TAG`. Once pushed, anyone can pull it. This is exactly how CI/CD pipelines work: build an image, push to a registry, deploy from the registry.

## 🧠 Architect Aside
> In production, you never deploy from a local build. The pipeline builds the image, scans it (Trivy), signs it (cosign), pushes to the registry, and the cluster pulls from the registry. Local → registry → cluster. This push is your first step in that chain. We'll add scanning and signing in Tier 3.

---
[← Previous](../24/README.md) | [Course Index](../../README.md) | [Next →](../25/README.md)
