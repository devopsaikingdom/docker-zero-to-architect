# Lesson 19: OCI Labels: Image Metadata

## What You'll Learn
Add standard labels for traceability.

## Commands
```bash
docker build -t lesson19 .
docker inspect lesson19 --format '{{json .Config.Labels}}' | python3 -m json.tool
```

## Explanation
OCI labels answer: who built this, when, from what source, what version? Understood by registries, scanners, and CI tools.

## Architect Note
> Labels are step one toward a fully auditable image supply chain (cosign, SLSA attestations come in Tier 4).

---
[← Previous](../18/) | [Course Index](../../README.md) | [Next →](../20/)
