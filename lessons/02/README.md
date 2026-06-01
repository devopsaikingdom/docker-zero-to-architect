# Lesson 02: Interactive Shell Inside a Container

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Get a shell inside a running container and explore the isolated filesystem.

## 📺 YouTube
**Docker Lesson 2: Get INSIDE a Container (Interactive Shell)**

## 💼 LinkedIn Hook
> Want to really understand what a container is? Get inside one. `docker run -it ubuntu bash` — and what you see (and DON'T see) will change how you think about containers forever.

## ⌨️ Commands
```bash
docker run -it ubuntu bash
# Inside the container:
whoami
hostname
cat /etc/os-release
ls /
ps aux
exit
docker ps -a
```

## 🎙️ Commentary
Let's get inside a container. `docker run -it ubuntu bash` gives us an interactive terminal. `-i` keeps stdin open, `-t` allocates a TTY. Inside, we're root in what looks like a fresh Ubuntu install. But `ps aux` shows only our bash process — no systemd, no kernel, no services. That's the proof: this isn't a VM. It's one process with an isolated view of the filesystem. When we exit, the container stops because the main process (bash) ended.

## 🧠 Architect Aside
> In interviews, if someone asks 'what's the difference between a container and a VM,' the winning answer is: 'A VM virtualizes hardware and runs its own kernel. A container shares the host kernel and virtualizes the process view — filesystem, network, PIDs — using namespaces.' That single sentence shows architect-level understanding.

---
[← Previous](../01/README.md) | [Course Index](../../README.md) | [Next →](../03/README.md)
