#!/bin/bash
# Lesson 21: Volumes: Persist Data
set -e

docker volume create kingdom-data
docker run -d --name db -v kingdom-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=kingdom123 postgres:16-alpine
sleep 3
docker exec db psql -U postgres -c "CREATE TABLE test (id serial, name text);"
docker stop db && docker rm db
docker run -d --name db2 -v kingdom-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=kingdom123 postgres:16-alpine
sleep 3
docker exec db2 psql -U postgres -c "SELECT * FROM test;"
docker stop db2 && docker rm db2
