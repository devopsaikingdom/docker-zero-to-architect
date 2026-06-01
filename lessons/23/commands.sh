#!/bin/bash
# Lesson 23: Environment-Based Configuration
set -e

docker build -t lesson23 .
docker run -e APP_ENV=staging -e DB_HOST=staging-db lesson23
docker run --env-file .env.prod lesson23
