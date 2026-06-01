# Lesson 06: ENV and ARG: Build-Time vs Runtime Config

> **DevOps AI Kingdom** — Docker: Zero to Architect

## 🎯 Outcome
Use ENV for runtime and ARG for build-time configuration.

## 📺 YouTube
**Docker Lesson 6: ENV vs ARG — The Config Mistake Everyone Makes**

## 💼 LinkedIn Hook
> Build-time vs runtime config is one of the most confused Docker concepts. Here's the rule: if the value changes between environments, it's ENV. If it changes between builds, it's ARG.

## ⌨️ Commands
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

## 🎙️ Commentary
ENV sets environment variables that persist in the running container. ARG sets variables only available during build. The key difference: ENV is for runtime config (database URLs, feature flags). ARG is for build-time choices (version numbers, base image variants). You can pass ARG values with `--build-arg` and override ENV values with `-e` at runtime. This is the foundation of 12-factor app configuration.

## 🧠 Architect Aside
> The 12-Factor App methodology says: store config in the environment. In Kubernetes, this becomes ConfigMaps and Secrets injected as env vars. Understanding ENV here sets you up for production-grade config management later. Never hardcode config — always ENV.

---
[← Previous](../05/README.md) | [Course Index](../../README.md) | [Next →](../07/README.md)
