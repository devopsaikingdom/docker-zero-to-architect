# Lesson 15: Container Lifecycle: stop, start, rm

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Understand the complete container lifecycle and state transitions.

## 📺 YouTube
**Docker Lesson 15: Container Lifecycle — From Birth to Death (and Cleanup)**

## 💼 LinkedIn Hook
> docker stop, kill, rm, prune — they all do different things. The 10-second grace period between SIGTERM and SIGKILL can make or break your production deployments.

## ⌨️ Commands
```bash
docker run -d --name lifecycle nginx:alpine
docker ps
docker stop lifecycle
docker ps
docker ps -a
docker start lifecycle
docker ps
docker restart lifecycle
docker pause lifecycle
docker ps
docker unpause lifecycle
docker kill lifecycle
docker ps -a
docker rm lifecycle
# Remove all stopped containers:
docker container prune -f
# Nuclear option:
docker system prune -f
```

## 🎙️ Commentary
A container has states: Created → Running → Paused → Stopped → Removed. `docker stop` sends SIGTERM, waits 10 seconds, then SIGKILL. `docker kill` sends SIGKILL immediately. `docker restart` = stop + start. `docker pause` freezes the process (uses cgroups freezer). `docker rm` removes a stopped container. `docker container prune` removes ALL stopped containers. `docker system prune` removes everything unused — containers, images, networks, build cache.

## 🧠 Architect Aside
> The 10-second grace period on `docker stop` matters in production. If your app doesn't handle SIGTERM, it gets SIGKILL'd after 10 seconds — meaning in-flight requests are dropped. In Kubernetes, the `terminationGracePeriodSeconds` (default 30s) does the same thing. Apps MUST handle graceful shutdown. We'll build this in Tier 2.

---
[← Previous](../14/README.md) | [Course Index](../../README.md) | [Next →](../16/README.md)
