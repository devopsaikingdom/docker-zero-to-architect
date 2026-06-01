# Lesson 01: What a Container Actually Is

## What You'll Learn
Run your first container and understand what just happened.

## Commands
```bash
docker run hello-world
docker ps -a
docker images
```

## Explanation
A container is **not** a tiny virtual machine. It's a normal Linux process isolated using namespaces and cgroups.

When you run `docker run hello-world`, Docker:
1. Checks if the image exists locally
2. Pulls it from Docker Hub if not found
3. Creates a container from the image
4. Runs the container's default command
5. The container exits when the command finishes

`docker ps -a` shows all containers (including stopped ones). `docker images` shows what's been pulled.

## Architect Note
> The thing that separates junior from senior is internalizing that a container is an isolated process, not a small VM. Everything else in this course follows from that mental model.

---
 | [Course Index](../../README.md) | [Next →](../02/)
