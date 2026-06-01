# Lesson 06: ENV and ARG: Build-Time vs Runtime Config

## What You'll Learn
Use ENV for runtime and ARG for build-time configuration.

## Commands
```bash
cat > app.py << 'EOF'
import os
print(f"App: {os.environ.get('APP_NAME')}")
print(f"Version: {os.environ.get('APP_VERSION')}")
print(f"Environment: {os.environ.get('APP_ENV')}")
EOF
docker build -t lesson06 .
docker run lesson06
docker build -t lesson06:v2 --build-arg APP_VERSION=2.0.0 .
docker run lesson06:v2
docker run -e APP_ENV=staging lesson06
```

## Explanation
`ENV` sets environment variables that persist in the running container (runtime config).
`ARG` sets variables only available during the build (build-time config).

- Pass ARG values with `--build-arg`
- Override ENV values at runtime with `-e`

**Rule:** If the value changes between environments → ENV. If it changes between builds → ARG.

## Architect Note
> The 12-Factor App says: store config in the environment. In Kubernetes, this becomes ConfigMaps and Secrets injected as env vars. Understanding ENV here sets you up for production config management.

---
[← Previous](../05/) | [Course Index](../../README.md) | [Next →](../07/)
