# Lesson 12: One Image, Many Containers

## What You'll Learn
Run multiple containers from a single image.

## Commands
```bash
docker build -t lesson12 .
docker run -d -p 8081:8080 --name app1 lesson12
docker run -d -p 8082:8080 --name app2 lesson12
curl http://localhost:8081
curl http://localhost:8082
docker stop app1 app2 && docker rm app1 app2
```

## Explanation
One image, multiple containers — each with its own hostname and network. This is the foundation of horizontal scaling and exactly how Kubernetes ReplicaSets work.

## Architect Note
> When Kubernetes sets `replicas: 3`, it creates 3 containers from one image. What we do manually here is what K8s automates.

---
[← Previous](../11/) | [Course Index](../../README.md) | [Next →](../13/)
