# Lesson 15: Container Lifecycle: stop, start, rm

## What You'll Learn
Understand container state transitions.

## Commands
```bash
docker run -d --name lifecycle nginx:alpine
docker stop lifecycle
docker start lifecycle
docker restart lifecycle
docker kill lifecycle
docker rm lifecycle
docker container prune -f
```

## Explanation
Container states: Created → Running → Paused → Stopped → Removed. `stop` sends SIGTERM (10s grace) then SIGKILL. `kill` sends SIGKILL immediately. `prune` removes all stopped containers.

## Architect Note
> The 10-second grace period matters. Apps must handle SIGTERM for graceful shutdown. In K8s, `terminationGracePeriodSeconds` does the same thing.

---
[← Previous](../14/) | [Course Index](../../README.md) | [Next →](../16/)
