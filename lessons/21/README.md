# Lesson 21: Volumes: Persist Data

## What You'll Learn
Use volumes so data survives container restarts.

## Commands
```bash
docker volume create kingdom-data
docker run -d --name db -v kingdom-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=kingdom123 postgres:16-alpine
sleep 3
docker exec db psql -U postgres -c "CREATE TABLE test (id serial, name text);"
docker stop db && docker rm db
docker run -d --name db2 -v kingdom-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=kingdom123 postgres:16-alpine
sleep 3
docker exec db2 psql -U postgres -c "SELECT * FROM test;"
docker stop db2 && docker rm db2
```

## Explanation
Volumes store data outside the container. When the container dies, the volume persists. Mount with `-v name:/path`.

## Architect Note
> In K8s: PersistentVolumes and PersistentVolumeClaims. Same concept backed by EBS/EFS.

---
[← Previous](../20/) | [Course Index](../../README.md) | [Next →](../22/)
