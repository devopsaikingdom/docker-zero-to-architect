# Lesson 13: docker exec: Look Inside Running Containers

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Execute commands inside a running container for debugging.

## 📺 YouTube
**Docker Lesson 13: Debug ANY Container with docker exec**

## 💼 LinkedIn Hook
> Something's broken in your container? Don't guess — get inside. `docker exec` is the #1 debugging tool, and here's how to use it like a senior engineer.

## ⌨️ Commands
```bash
docker run -d --name debug-me nginx:alpine
docker exec debug-me cat /etc/nginx/nginx.conf
docker exec debug-me ls -la /usr/share/nginx/html/
docker exec -it debug-me sh
# Inside:
ps aux
df -h
cat /proc/1/cmdline | tr '\0' ' '
exit
docker exec debug-me env
docker logs debug-me
docker stop debug-me && docker rm debug-me
```

## 🎙️ Commentary
docker exec lets you run commands inside a RUNNING container — essential for debugging. Without `-it`, it runs the command and returns output. With `-it`, you get an interactive shell. `ps aux` inside shows only the container's processes. `cat /proc/1/cmdline` reveals the main process. This is your #1 debugging tool — before checking logs, get inside and look around.

## 🧠 Architect Aside
> In production Kubernetes, the equivalent is `kubectl exec -it pod/name -- sh`. Same mental model. But in production, many images (distroless, scratch) don't have a shell. That's why K8s has ephemeral containers (`kubectl debug`) — we'll cover that in Tier 4.

---
[← Previous](../12/README.md) | [Course Index](../../README.md) | [Next →](../14/README.md)
