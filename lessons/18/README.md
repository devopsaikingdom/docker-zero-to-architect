# Lesson 18: Image Size Comparison

## What You'll Learn
Compare sizes and learn why it matters.

## Commands
```bash
echo 'print("size demo")' > app.py
docker build -t size-bloated --target bloated .
docker build -t size-optimized --target optimized .
docker build -t size-tiny --target tiny .
docker images --format '{{.Repository}}\t{{.Size}}' | grep size-
```

## Explanation
python:3.11 ≈ 1GB. python:3.11-slim ≈ 120MB. python:3.11-alpine ≈ 50MB. Multi-target builds let you compare. In production, set image size budgets — flag anything over 200MB for review.

## Architect Note
> At 100+ microservices, image size × replicas × deploys = real cost.

---
[← Previous](../17/) | [Course Index](../../README.md) | [Next →](../19/)
