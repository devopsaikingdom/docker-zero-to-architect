# Lesson 13: docker exec: Debug Running Containers

## What You'll Learn
Execute commands inside a running container.

## Commands
```bash
docker run -d --name debug-me nginx:alpine
docker exec debug-me cat /etc/nginx/nginx.conf
docker exec -it debug-me sh
ps aux
exit
docker stop debug-me && docker rm debug-me
```

## Explanation
`docker exec` runs commands inside a RUNNING container. Without `-it`, it returns output. With `-it`, you get an interactive shell. Essential debugging tool.

## Architect Note
> In K8s: `kubectl exec -it pod/name -- sh`. Same concept. Distroless images don't have shells — use `kubectl debug` instead.

---
[← Previous](../12/) | [Course Index](../../README.md) | [Next →](../14/)
