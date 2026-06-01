# Lesson 03: Your First Dockerfile

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Write a Dockerfile from scratch and build your first custom image.

## 📺 YouTube
**Docker Lesson 3: Write Your FIRST Dockerfile (From Scratch)**

## 💼 LinkedIn Hook
> Your first custom Docker image, built from a 3-line Dockerfile. But that simple file teaches you the 3 most important instructions: FROM, RUN, CMD. Here's the architect's way to think about each one.

## ⌨️ Commands
```bash
cat Dockerfile
docker build -t my-first-image .
docker run my-first-image
docker images | grep my-first-image
docker history my-first-image
```

## 🎙️ Commentary
Now we create our own image. A Dockerfile is a recipe — each instruction becomes a layer. FROM sets the base image. RUN executes a command during build. CMD is what runs when the container starts. `docker build -t my-first-image .` reads the Dockerfile, executes each instruction, and tags the result. `docker history` shows you every layer and its size. This is how every production image starts.

## 🧠 Architect Aside
> Always combine RUN commands with && to reduce layers. Every RUN creates a new layer, and layers are cached. In production, you want minimal layers for smaller images and faster pulls. We'll optimize this pattern through the whole course.

---
[← Previous](../02/README.md) | [Course Index](../../README.md) | [Next →](../04/README.md)
