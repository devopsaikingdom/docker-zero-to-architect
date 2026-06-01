# Lesson 09: Image Layers and docker history

## What You'll Learn
Understand how layers work, inspect them, and see why they matter.

## Commands
```bash
echo '#!/bin/bash' > hello.sh
echo 'echo "Each instruction = one layer"' >> hello.sh
docker build -t lesson09 .
docker history lesson09
docker system df
```

## Explanation
Every Dockerfile instruction creates a **layer**. Layers are:
- **Cached** — unchanged layers are reused (fast builds)
- **Shared** — images with the same base share layers on disk
- **Immutable** — once created, a layer never changes

`docker history` shows every layer, its size, and the command that created it. Put things that change least first (base, deps) and things that change most last (your code).

## Architect Note
> At scale, standardizing base images across your org lets the registry deduplicate shared layers automatically. This saves real storage costs.

---
[← Previous](../08/) | [Course Index](../../README.md) | [Next →](../10/)
