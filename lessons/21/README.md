# Lesson 21: Volumes 101: Persist Data Beyond Container Lifecycle

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Use Docker volumes to persist data that survives container restarts.

## 📺 YouTube
**Docker Lesson 21: Docker Volumes — Your Data Survives Container Death**

## 💼 LinkedIn Hook
> Containers are ephemeral. Your database isn't. Here's how volumes keep your data alive when containers die — and the exact pattern Kubernetes uses.

## ⌨️ Commands
```bash
docker volume create kingdom-data
docker volume ls
docker volume inspect kingdom-data
docker run -d --name db -v kingdom-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=kingdom123 -e POSTGRES_DB=devops_kingdom postgres:16-alpine
sleep 3
docker exec db psql -U postgres -d devops_kingdom -c "CREATE TABLE lessons (id SERIAL, title TEXT);"
docker exec db psql -U postgres -d devops_kingdom -c "INSERT INTO lessons (title) VALUES ('Hello World'), ('Interactive Shell'), ('First Dockerfile');"
docker exec db psql -U postgres -d devops_kingdom -c "SELECT * FROM lessons;"
docker stop db && docker rm db
# Data survives!
docker run -d --name db2 -v kingdom-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=kingdom123 postgres:16-alpine
sleep 3
docker exec db2 psql -U postgres -d devops_kingdom -c "SELECT * FROM lessons;"
docker stop db2 && docker rm db2
```

## 🎙️ Commentary
Containers are ephemeral — when they're removed, their filesystem is gone. Volumes solve this by storing data outside the container. `docker volume create` makes a named volume managed by Docker. `-v kingdom-data:/var/lib/postgresql/data` mounts it inside the container. The key proof: we create data, destroy the container, start a new one with the same volume — data is still there. This is how databases work in Docker.

## 🧠 Architect Aside
> In Kubernetes, this becomes PersistentVolumes and PersistentVolumeClaims. Same concept: storage that outlives the pod. The critical difference: in K8s, PVs can be backed by EBS, EFS, or any CSI driver, giving you cloud-native durability. Volumes here are the foundation.

---
[← Previous](../20/README.md) | [Course Index](../../README.md) | [Next →](../22/README.md)
