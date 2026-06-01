# Lesson 02: Interactive Shell Inside a Container

## What You'll Learn
Get a shell inside a running container and explore the isolated filesystem.

## Commands
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

## Explanation
`docker run -it ubuntu bash` gives you an interactive terminal inside a container.
- `-i` keeps stdin open
- `-t` allocates a pseudo-TTY

Inside, you're root in what looks like a fresh Ubuntu. But `ps aux` shows only your bash process — no systemd, no kernel, nothing else. That's the proof: this is one process with an isolated view.

When you `exit`, the container stops because its main process (bash) ended.

## Architect Note
> In interviews, the winning answer to 'container vs VM': A VM virtualizes hardware and runs its own kernel. A container shares the host kernel and isolates the process view using namespaces.

---
[← Previous](../01/) | [Course Index](../../README.md) | [Next →](../03/)
