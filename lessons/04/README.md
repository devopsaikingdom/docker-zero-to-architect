# Lesson 04: Installing Software with RUN

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Install packages properly in Docker and understand layer caching.

## 📺 YouTube
**Docker Lesson 4: Install Software the RIGHT Way (Not the Bloated Way)**

## 💼 LinkedIn Hook
> 90% of Docker images I review in production have bloated RUN commands. Here's the 3-rule pattern that cuts image size by 30-50%.

## ⌨️ Commands
```bash
docker build -t lesson04 .
docker run -it lesson04
# Inside:
curl --version
wget --version
vim --version
exit
docker history lesson04
docker images lesson04
```

## 🎙️ Commentary
RUN is where most image bloat happens. Three rules: always combine `apt-get update` with `apt-get install` in ONE RUN (otherwise the update layer gets cached and your installs use stale package lists). Use `--no-install-recommends` to skip unnecessary packages. And always clean up with `rm -rf /var/lib/apt/lists/*` to shrink the layer. This single pattern can cut image size by 30-50%.

## 🧠 Architect Aside
> In a production Dockerfile review, the first thing I check is whether RUN commands are combined and cleaned up. Separate `RUN apt-get update` and `RUN apt-get install` is a red flag — it means stale package lists and unnecessary layers. This is the kind of thing that separates a Docker user from a Docker architect.

---
[← Previous](../03/README.md) | [Course Index](../../README.md) | [Next →](../05/README.md)
