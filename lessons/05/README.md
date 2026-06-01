# Lesson 05: COPY and WORKDIR

## What You'll Learn
Copy files into an image and set the working directory.

## Commands
```bash
echo 'print("Hello from DevOps AI Kingdom!")' > hello.py
docker build -t lesson05 .
docker run lesson05
```

## Explanation
`WORKDIR` sets where commands run inside the container — like a permanent `cd`. If the directory doesn't exist, Docker creates it.

`COPY` brings files from your machine into the image. The `.` at the end means "copy into the current WORKDIR."

Always use WORKDIR instead of `RUN cd /somewhere` — WORKDIR is explicit and persistent.

## Architect Note
> COPY invalidates the build cache for everything after it. That's why you COPY dependency files first, install deps, THEN copy source code. Code changes won't re-install dependencies.

---
[← Previous](../04/) | [Course Index](../../README.md) | [Next →](../06/)
