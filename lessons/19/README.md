# Lesson 19: OCI Labels: Image Metadata That Matters

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Add standard OCI labels for traceability and tooling integration.

## 📺 YouTube
**Docker Lesson 19: OCI Labels — The Metadata Your Images Are Missing**

## 💼 LinkedIn Hook
> Can you tell WHO built an image, WHEN, and from WHAT code? If not, your images are missing OCI labels. Here's the standard every production image should follow.

## ⌨️ Commands
```bash
docker build -t lesson19 .
docker inspect lesson19 --format '{{json .Config.Labels}}' | python3 -m json.tool
docker images --filter "label=org.opencontainers.image.authors=devopsaikingdom@gmail.com"
```

## 🎙️ Commentary
Labels are key-value metadata on images. OCI standard labels (org.opencontainers.image.*) are understood by registries, scanners, and CI/CD tools. They answer: who built this, when, from what source, what version? In production, labels enable filtering, auditing, and automation. You can query all images by a label.

## 🧠 Architect Aside
> In a supply chain security pipeline, labels prove provenance — who built the image, from what commit, when. Tools like cosign and SLSA attestations extend this. Labels are step one toward a fully auditable image supply chain, which we build in Tier 4.

---
[← Previous](../18/README.md) | [Course Index](../../README.md) | [Next →](../20/README.md)
