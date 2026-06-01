# Lesson 23: Environment-Based Configuration

## What You'll Learn
Same image, different environments.

## Commands
```bash
docker build -t lesson23 .
docker run -e APP_ENV=staging -e DB_HOST=staging-db lesson23
docker run --env-file .env.prod lesson23
```

## Explanation
One image, multiple environments — only env vars change. `-e` overrides individual vars. `--env-file` loads from a file. This is 12-factor config.

## Architect Note
> In K8s: ConfigMaps (non-sensitive) and Secrets (sensitive). The app code is identical — it reads env vars.

---
[← Previous](../22/) | [Course Index](../../README.md) | [Next →](../24/)
