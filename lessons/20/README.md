# Lesson 20: Static Website with Nginx

## What You'll Learn
Containerize a website with health checks.

## Commands
```bash
echo '<h1>DevOps AI Kingdom</h1>' > index.html
docker build -t lesson20 .
docker run -d -p 8080:80 --name site lesson20
curl http://localhost:8080
docker stop site && docker rm site
```

## Explanation
Nginx + static files + HEALTHCHECK is the most common Docker pattern. HEALTHCHECK tells Docker (and K8s) how to verify the container is healthy.

## Architect Note
> HEALTHCHECK maps to K8s readinessProbe/livenessProbe. Containers without health checks are invisible to load balancers.

---
[← Previous](../19/) | [Course Index](../../README.md) | [Next →](../21/)
