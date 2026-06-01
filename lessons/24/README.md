# Lesson 24: docker stats: Monitor Resources

## What You'll Learn
Watch CPU and memory usage in real-time.

## Commands
```bash
docker run -d --name stress --memory=100m lesson24
docker stats stress --no-stream
docker inspect stress --format '{{.State.OOMKilled}}'
docker rm -f stress
```

## Explanation
`docker stats` shows live CPU, memory, network per container. `--memory=100m` sets a limit. Exceed it = OOMKilled. This is exactly what happens in K8s when pods exceed memory limits.

## Architect Note
> K8s resource requests/limits = Docker's --memory and --cpus. No limits = one pod eats the whole node.

---
[← Previous](../23/) | [Course Index](../../README.md) | [Next →](../25/)
