# Lesson 11: Tagging Images

## What You'll Learn
Tag images properly and understand the 'latest' trap.

## Commands
```bash
docker build -t lesson11:1.0.0 .
docker tag lesson11:1.0.0 lesson11:latest
docker tag lesson11:1.0.0 lesson11:1.0
docker images lesson11
```

## Explanation
Tags are pointers — one image can have many. Use semantic versioning: `1.0.0`, `1.0`, `1`, `latest`. **Never use `latest` in production** — it's mutable and you won't know what's running.

## Architect Note
> In production, use immutable tags (1.2.3) or image digests (sha256:abc...). 'latest' is a liability.

---
[← Previous](../10/) | [Course Index](../../README.md) | [Next →](../12/)
