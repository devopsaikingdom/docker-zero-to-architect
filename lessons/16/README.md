# Lesson 16: docker inspect: X-Ray Any Container

## What You'll Learn
Examine containers and images in detail.

## Commands
```bash
docker run -d --name inspect-me -p 8080:80 nginx:alpine
docker inspect inspect-me --format '{{.NetworkSettings.IPAddress}}'
docker inspect inspect-me --format '{{json .Config.Env}}' | python3 -m json.tool
docker stop inspect-me && docker rm inspect-me
```

## Explanation
`docker inspect` dumps everything about a container as JSON. `--format` uses Go templates to extract fields. Find IPs, env vars, mounts, port mappings — everything.

## Architect Note
> Go templates work in K8s too: `kubectl get pods -o custom-columns`. Learning them here pays off.

---
[← Previous](../15/) | [Course Index](../../README.md) | [Next →](../17/)
