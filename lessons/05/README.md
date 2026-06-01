# Lesson 05: COPY and WORKDIR

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Copy files into an image and set the working directory.

## 📺 YouTube
**Docker Lesson 5: COPY + WORKDIR — Where Your Code Lives in a Container**

## 💼 LinkedIn Hook
> Two instructions that seem simple but have a hidden superpower: build cache optimization. Here's how COPY order determines whether your builds take 2 seconds or 2 minutes.

## ⌨️ Commands
```bash
echo 'print("Hello from DevOps AI Kingdom!")' > hello.py
cat Dockerfile
docker build -t lesson05 .
docker run lesson05
docker run -it lesson05 pwd
docker run -it lesson05 ls -la
```

## 🎙️ Commentary
WORKDIR sets where commands run inside the container — like `cd` but permanent. If the directory doesn't exist, Docker creates it. COPY brings files from your machine into the image. The `.` at the end means 'copy into the current WORKDIR.' Always use WORKDIR instead of `RUN cd /somewhere` — WORKDIR is explicit and every subsequent instruction uses it.

## 🧠 Architect Aside
> COPY has a subtle but critical behavior: it invalidates the build cache for everything after it. That's why in production Dockerfiles, you always COPY dependency files (requirements.txt) first, install deps, THEN copy your source code. That way code changes don't re-install all dependencies. We'll use this pattern starting in Tier 2.

---
[← Previous](../04/README.md) | [Course Index](../../README.md) | [Next →](../06/README.md)
