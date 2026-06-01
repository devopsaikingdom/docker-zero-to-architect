# Lesson 14: docker logs: Reading Container Output

## What You'll Learn
View and follow container logs.

## Commands
```bash
docker build -t lesson14 .
docker run -d --name logger lesson14
docker logs logger --tail 5
docker logs logger -f
docker logs logger --since 30s
docker stop logger && docker rm logger
```

## Explanation
Containers write to stdout/stderr. `docker logs` reads this output. `--tail N` shows last N lines. `-f` follows in real-time. `--since` filters by time. In production, log collectors capture stdout and ship to your logging platform.

## Architect Note
> 12-factor rule: never write logs to files inside the container. Write to stdout. Let the platform handle collection.

---
[← Previous](../13/) | [Course Index](../../README.md) | [Next →](../15/)
