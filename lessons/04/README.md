# Lesson 04: Installing Software with RUN

## What You'll Learn
Install packages properly in Docker and understand layer caching.

## Commands
```bash
docker build -t lesson04 .
docker run -it lesson04
curl --version
wget --version
exit
docker history lesson04
```

## Explanation
Three rules for RUN commands that prevent image bloat:

1. **Combine `apt-get update` with `apt-get install`** in one RUN — otherwise the update layer gets cached and installs use stale package lists
2. **Use `--no-install-recommends`** — skip unnecessary packages
3. **Clean up with `rm -rf /var/lib/apt/lists/*`** — remove the package cache

This pattern can cut image size by 30-50%.

## Architect Note
> Separate `RUN apt-get update` and `RUN apt-get install` is a red flag in any Dockerfile review. It means stale package lists and unnecessary layers.

---
[← Previous](../03/) | [Course Index](../../README.md) | [Next →](../05/)
