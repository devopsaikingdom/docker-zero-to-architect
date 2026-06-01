# Lesson 08: CMD vs ENTRYPOINT: The Real Difference

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Understand when to use CMD vs ENTRYPOINT and how they interact.

## 📺 YouTube
**Docker Lesson 8: CMD vs ENTRYPOINT — The #1 Dockerfile Confusion Solved**

## 💼 LinkedIn Hook
> Everyone gets this wrong in interviews. CMD = default (overridable). ENTRYPOINT = fixed (appendable). Together they're the most powerful pattern in Docker.

## ⌨️ Commands
```bash
docker build -t lesson08 .
docker run lesson08
docker run lesson08 https://httpbin.org/headers
docker run --entrypoint bash -it lesson08
# Compare with CMD-only:
cat > Dockerfile.cmd << 'EOF'
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*
CMD ["curl", "-s", "https://httpbin.org/ip"]
EOF
docker build -t lesson08-cmd -f Dockerfile.cmd .
docker run lesson08-cmd
docker run lesson08-cmd echo "I replaced the entire command"
```

## 🎙️ Commentary
CMD is the default command — it can be completely overridden at runtime. ENTRYPOINT is the fixed command — runtime args get appended to it. Together: ENTRYPOINT is the 'verb' (curl), CMD is the 'default argument' (the URL). Users can override the argument without changing the tool. This pattern is how production CLI tools are containerized.

## 🧠 Architect Aside
> The ENTRYPOINT + CMD combo is the pattern behind every well-designed container CLI tool: `docker run myapp --help` works because --help appends to the ENTRYPOINT. If you use only CMD, `docker run myapp --help` replaces the entire command with `--help` which fails. This is the #1 Dockerfile design pattern for production tools.

---
[← Previous](../07/README.md) | [Course Index](../../README.md) | [Next →](../09/README.md)
