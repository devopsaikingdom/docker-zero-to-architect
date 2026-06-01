# Lesson 08: CMD vs ENTRYPOINT

## What You'll Learn
Understand when to use CMD vs ENTRYPOINT and how they interact.

## Commands
```bash
docker build -t lesson08 .
docker run lesson08
docker run lesson08 https://httpbin.org/headers
docker run --entrypoint bash -it lesson08
```

## Explanation
`CMD` = the default command. Can be completely overridden at runtime.
`ENTRYPOINT` = the fixed command. Runtime arguments get appended to it.

Together: ENTRYPOINT is the **verb** (curl), CMD is the **default argument** (the URL). Users can override the argument without changing the tool.

This is the pattern behind every well-designed container CLI tool.

## Architect Note
> If you use only CMD, `docker run myapp --help` replaces the entire command. With ENTRYPOINT, `--help` gets appended. This is the #1 Dockerfile design pattern.

---
[← Previous](../07/) | [Course Index](../../README.md) | [Next →](../09/)
