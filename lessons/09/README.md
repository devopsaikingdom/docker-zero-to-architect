# Lesson 09: Image Layers and docker history

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Understand how layers work, inspect them, and see why they matter for size and caching.

## 📺 YouTube
**Docker Lesson 9: Image Layers Explained — Why Order Matters More Than You Think**

## 💼 LinkedIn Hook
> Your image has 15 layers but only 3 of them change between builds. Understanding layers is the difference between 30-second and 5-minute builds.

## ⌨️ Commands
```bash
echo '#!/bin/bash' > hello.sh
echo 'echo "Each instruction = one layer"' >> hello.sh
echo 'echo "Layers are cached and shared"' >> hello.sh
docker build -t lesson09 .
docker history lesson09
docker history lesson09 --no-trunc
docker inspect lesson09 | grep -A 20 Layers
docker system df
```

## 🎙️ Commentary
Every Dockerfile instruction (FROM, RUN, COPY, etc.) creates a layer. Layers are cached — if nothing changes, Docker reuses the cached layer. `docker history` shows every layer, its size, and the command that created it. Layers are also shared between images — if two images use the same base, they share those layers on disk. This is why layer order matters: put things that change least (base, deps) first, and things that change most (your code) last.

## 🧠 Architect Aside
> In production, I've seen teams waste 40% of their registry storage because images don't share layers. The fix: standardize base images across your org (a 'golden base'), install common deps in the same order, and your registry deduplicates automatically. This is an architect-level optimization that saves real money at scale.

---
[← Previous](../08/README.md) | [Course Index](../../README.md) | [Next →](../10/README.md)
