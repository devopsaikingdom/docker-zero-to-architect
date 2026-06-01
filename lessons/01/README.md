# Lesson 01: Hello World: What a Container Actually Is

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Run your first container and understand what just happened.

## 📺 YouTube
**Docker Lesson 1: What a Container ACTUALLY Is (Not What You Think)**

## 💼 LinkedIn Hook
> Most people think containers are tiny VMs. They're not. Here's what happens when you run `docker run hello-world` — and the mental model that separates juniors from architects.

## ⌨️ Commands
```bash
docker run hello-world
docker ps -a
docker images
```

## 🎙️ Commentary
Before we build anything, let's prove Docker works. `docker run hello-world` pulls the image, creates a container, runs it, prints a message, and exits. That's the whole lifecycle: pull → run → exit. Mental model: a container is NOT a tiny VM. It's a normal Linux process isolated with namespaces and cgroups. `docker ps -a` shows our exited container. `docker images` shows what was pulled.

## 🧠 Architect Aside
> The thing that separates junior from senior is internalizing 'container = isolated process,' not 'container = small VM.' Everything else follows from that.

---
[← Previous](../01/README.md) | [Course Index](../../README.md) | [Next →](../02/README.md)
