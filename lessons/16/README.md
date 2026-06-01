# Lesson 16: docker inspect: X-Ray Any Container or Image

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Use docker inspect to examine containers and images in detail.

## 📺 YouTube
**Docker Lesson 16: docker inspect — See EVERYTHING About Any Container**

## 💼 LinkedIn Hook
> When something's wrong in a container, don't guess. `docker inspect` shows the IP, env vars, mounts, ports, state — everything. Plus the Go template trick that works in Kubernetes too.

## ⌨️ Commands
```bash
docker run -d --name inspect-me -p 8080:80 -e MY_VAR=hello -v /tmp/data:/data nginx:alpine
docker inspect inspect-me
docker inspect inspect-me --format '{{.State.Status}}'
docker inspect inspect-me --format '{{.NetworkSettings.IPAddress}}'
docker inspect inspect-me --format '{{json .Config.Env}}' | python3 -m json.tool
docker inspect inspect-me --format '{{range .Mounts}}{{.Source}} -> {{.Destination}}{{end}}'
docker inspect nginx:alpine --format '{{.Config.ExposedPorts}}'
docker stop inspect-me && docker rm inspect-me
```

## 🎙️ Commentary
docker inspect dumps EVERYTHING about a container or image as JSON. The --format flag uses Go templates to extract specific fields. This is your detective tool: find the IP address, check environment variables, see mount points, examine network config, verify the command that's running. In production, when something's wrong, `docker inspect` (or `kubectl describe` in K8s) is often the first command.

## 🧠 Architect Aside
> The --format flag uses Go templates — the same syntax Kubernetes uses for custom output columns (`kubectl get pods -o custom-columns`). Learning Go templates here pays off in K8s. Also, piping to `python3 -m json.tool` for pretty JSON is a trick that works everywhere.

---
[← Previous](../15/README.md) | [Course Index](../../README.md) | [Next →](../17/README.md)
