# Lesson 03: Your First Dockerfile

## What You'll Learn
Write a Dockerfile from scratch and build your first custom image.

## Commands
```bash
cat Dockerfile
docker build -t my-first-image .
docker run my-first-image
docker images | grep my-first-image
docker history my-first-image
```

## Explanation
A Dockerfile is a recipe — each instruction becomes a layer in the image.

- `FROM` — sets the base image (every Dockerfile starts here)
- `RUN` — executes a command during the build
- `CMD` — the default command when the container starts

`docker build -t my-first-image .` reads the Dockerfile, executes each instruction, and tags the result. `docker history` shows every layer and its size.

## Architect Note
> Always combine RUN commands with `&&` to reduce layers. Every RUN creates a new layer. In production, minimal layers = smaller images = faster pulls.

---
[← Previous](../02/) | [Course Index](../../README.md) | [Next →](../04/)
