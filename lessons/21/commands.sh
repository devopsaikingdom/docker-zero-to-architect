#!/bin/bash
# Lesson 21: Volumes 101: Persist Data Beyond Container Lifecycle
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

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
