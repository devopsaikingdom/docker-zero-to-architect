# 🐳 100 Docker Images — Zero to Architect

**DevOps AI Kingdom** · Every video we **build one real Docker image, live** — no slides-only lectures. 10 levels × 10 images. By image 100 you think like a DevSecOps architect, because you built like one.

> 🏦 **The spine:** one system grows underneath the whole series — the **SecureBank platform**. Images plug into it as we level up. By image 100 it's hardened, signed, observed, AI-enabled and Kubernetes-ready.

## 🔴 How this repo works (watch it grow)

Folders appear **live on stream**, one per video, in [`images/`](images/):

```
images/
├── 001-hello-kingdom/      ← video 1 (Dockerfile + app + commands.md)
├── 002-static-site/        ← video 2
└── ...                     ← 100 by the end
```

```bash
git clone https://github.com/devopsaikingdom/docker-zero-to-architect.git
cd docker-zero-to-architect/images/001-hello-kingdom
cat commands.md   # every command from the video, copy-paste ready
```

📖 Prefer reading? [`lessons/`](lessons/) has written study notes for the foundation topics. The live builds in `images/` are the main series.

## 🗺️ The 100 Images

**Legend:** ✅ built on stream · 🔴 next live · ⏳ coming

<details open><summary><b>LEVEL 1 — First Blood (001–010) · FROM, RUN, COPY, CMD, tags</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 001 | `hello-kingdom` | FROM, CMD, build/run, image vs container | 🔴 |
| 002 | `static-site` | COPY, EXPOSE, port mapping, detached mode | ⏳ |
| 003 | `cowsay-oracle` | RUN, package installs, layers | ⏳ |
| 004 | `python-greeter` | CMD vs ENTRYPOINT | ⏳ |
| 005 | `node-clock` | WORKDIR, runtime images | ⏳ |
| 006 | `bash-toolbox` | ENTRYPOINT patterns, -it | ⏳ |
| 007 | `api-poker` | ENTRYPOINT + CMD combo, runtime args | ⏳ |
| 008 | `ascii-banner` | ARG, build-time vs runtime | ⏳ |
| 009 | `tiny-logger` | docker logs, stdout philosophy | ⏳ |
| 010 | **`kingdom-gate`** 🏰 | **CHECKPOINT:** Docker Hub, tags, digests, push | ⏳ |
</details>

<details><summary><b>LEVEL 2 — Real Apps (011–020) · ENV, cache, healthchecks</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 011 | `flask-api` | requirements pattern, pip in images | ⏳ |
| 012 | `express-api` | npm ci, lockfiles | ⏳ |
| 013 | `fastapi-todo` | uvicorn, EXPOSE conventions | ⏳ |
| 014 | `go-api` | compiled vs interpreted images | ⏳ |
| 015 | `spring-api` | JVM images, memory flags | ⏳ |
| 016 | `php-board` | image variants (-apache, -fpm) | ⏳ |
| 017 | `env-chameleon` | ENV, --env-file, 12-factor | ⏳ |
| 018 | `cache-master` | layer-cache rules, .dockerignore | ⏳ |
| 019 | `self-healing-api` | HEALTHCHECK, restart policies | ⏳ |
| 020 | **`bank-teller-v0`** 🏦 | **CHECKPOINT:** the banking API is born | ⏳ |
</details>

<details><summary><b>LEVEL 3 — Size & Build Mastery (021–030) · multi-stage, scratch, distroless</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 021 | `go-scratch` | FROM scratch, static binaries | ⏳ |
| 022 | `react-twostage` | multi-stage builds | ⏳ |
| 023 | `python-slim-wheels` | multi-stage for interpreted langs | ⏳ |
| 024 | `java-jre-only` | build deps vs run deps | ⏳ |
| 025 | `distroless-api` | distroless, attack surface | ⏳ |
| 026 | `alpine-vs-debian` | base trade-offs, musl gotchas | ⏳ |
| 027 | `dive-detective` | dive, layer forensics | ⏳ |
| 028 | `context-zero` | build context mastery | ⏳ |
| 029 | `upx-micro` | binary compression trade-offs | ⏳ |
| 030 | **`the-diet`** ⚖️ | **CHECKPOINT:** 1 GB → <60 MB | ⏳ |
</details>

<details><summary><b>LEVEL 4 — Data & State (031–040) · volumes, users, persistence</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 031 | `postgres-kingdom` | init scripts, official-image magic | ⏳ |
| 032 | `mysql-seeded` | named volumes, lifecycle | ⏳ |
| 033 | `redis-tuned` | config + command override | ⏳ |
| 034 | `mongo-seeded` | bind mounts vs volumes | ⏳ |
| 035 | `backup-cron` | sidecar pattern, cron | ⏳ |
| 036 | `minio-vault` | local S3, object storage | ⏳ |
| 037 | `nonroot-api` | USER, permissions | ⏳ |
| 038 | `readonly-fortress` | --read-only, tmpfs | ⏳ |
| 039 | `data-migrator` | one-shot job containers | ⏳ |
| 040 | **`bank-vault`** 🔐 | **CHECKPOINT:** stateful stack that survives anything | ⏳ |
</details>

<details><summary><b>LEVEL 5 — Networking & Compose (041–050) · DNS, proxies, composition</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 041 | `nginx-gatekeeper` | reverse proxy, upstreams | ⏳ |
| 042 | `compose-duo` | compose, service DNS | ⏳ |
| 043 | `fullstack-trio` | depends_on, healthcheck gates | ⏳ |
| 044 | `caddy-https` | TLS, auto-certs | ⏳ |
| 045 | `haproxy-balancer` | scaling, load balancing | ⏳ |
| 046 | `websocket-live` | long-lived connections | ⏳ |
| 047 | `grpc-pair` | gRPC service-to-service | ⏳ |
| 048 | `dns-detective` | embedded DNS, 127.0.0.11 | ⏳ |
| 049 | `traefik-router` | label-based routing | ⏳ |
| 050 | **`banking-platform-v1`** 🏦 | **CHECKPOINT:** 6 services, one command | ⏳ |
</details>

<details><summary><b>LEVEL 6 — DevSecOps (051–060) · scan, sign, secrets, harden</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 051 | `trivy-tribunal` | CVE scanning, triage | ⏳ |
| 052 | `hardened-base` | golden base images, digest pinning | ⏳ |
| 053 | `buildkit-secrets` | --secret, why ENV leaks | ⏳ |
| 054 | `cosign-sealed` | image signing, supply chain | ⏳ |
| 055 | `sbom-xray` | SBOMs with syft | ⏳ |
| 056 | `zap-striker` | DAST our own API | ⏳ |
| 057 | `vault-keeper` | runtime secrets with Vault | ⏳ |
| 058 | `cis-nginx` | hardening, dropped capabilities | ⏳ |
| 059 | `sentinel-falco` | runtime threat detection | ⏳ |
| 060 | **`fort-knox`** 🛡️ | **CHECKPOINT:** the secure-image pipeline | ⏳ |
</details>

<details><summary><b>LEVEL 7 — CI/CD & Registry (061–070) · pipelines, multi-arch, promotion</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 061 | `registry-throne` | self-hosted registry + auth | ⏳ |
| 062 | `gha-forge` | GitHub Actions builds → GHCR | ⏳ |
| 063 | `jenkins-smith` | custom CI agent images | ⏳ |
| 064 | `gitlab-runner-rig` | GitLab CI, DinD dangers | ⏳ |
| 065 | `buildx-hydra` | multi-arch (amd64+arm64) | ⏳ |
| 066 | `cache-rocket` | BuildKit cache mounts | ⏳ |
| 067 | `test-gauntlet` | tests inside the build | ⏳ |
| 068 | `semver-stamper` | tagging strategy, releases | ⏳ |
| 069 | `promotion-train` | Artifactory/Nexus, promote-don't-rebuild | ⏳ |
| 070 | **`assembly-line`** 🏭 | **CHECKPOINT:** commit → test → scan → sign → push | ⏳ |
</details>

<details><summary><b>LEVEL 8 — Observability (071–080) · metrics, logs, traces</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 071 | `prometheus-eye` | metrics, scraping | ⏳ |
| 072 | `grafana-throne-room` | dashboards as code | ⏳ |
| 073 | `instrumented-api` | /metrics, RED method | ⏳ |
| 074 | `loki-scribe` | log aggregation | ⏳ |
| 075 | `json-crier` | structured logging | ⏳ |
| 076 | `otel-oracle` | OpenTelemetry collector | ⏳ |
| 077 | `jaeger-tracker` | distributed tracing | ⏳ |
| 078 | `node-exporter-scout` | host/container metrics | ⏳ |
| 079 | `alert-herald` | alerting without fatigue | ⏳ |
| 080 | **`mission-control`** 📡 | **CHECKPOINT:** full observability on SecureBank | ⏳ |
</details>

<details><summary><b>LEVEL 9 — AI-Native (081–090) · LLMs, inference, RAG</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 081 | `ollama-brain` | local LLM serving | ⏳ |
| 082 | `open-webui` | AI stack composition | ⏳ |
| 083 | `jupyter-lab-custom` | reproducible DS images | ⏳ |
| 084 | `torch-inference` | model APIs | ⏳ |
| 085 | `whisper-scribe` | media processing | ⏳ |
| 086 | `fraud-sentinel` | ML fraud detection for SecureBank | ⏳ |
| 087 | `vector-keep` | vector databases | ⏳ |
| 088 | `rag-sage` | the RAG pattern | ⏳ |
| 089 | `k8sgpt-counsel` | AIOps | ⏳ |
| 090 | **`ai-wing`** 🤖 | **CHECKPOINT:** AI live in the platform | ⏳ |
</details>

<details><summary><b>LEVEL 10 — Architect (091–100) · internals, K8s-ready, capstone</b></summary>

| # | Image | You learn | Status |
|---|---|---|---|
| 091 | `pid1-reaper` | PID 1, signals, tini | ⏳ |
| 092 | `graceful-exit` | graceful shutdown | ⏳ |
| 093 | `kaniko-builder` | daemonless builds | ⏳ |
| 094 | `gvisor-sandbox` | isolation spectrum | ⏳ |
| 095 | `k8s-citizen` | probes, lifecycle, kind | ⏳ |
| 096 | `chaos-imp` | chaos engineering | ⏳ |
| 097 | `finops-meter` | right-sizing, cost | ⏳ |
| 098 | `org-base-2.0` | platform engineering | ⏳ |
| 099 | `banking-platform-final` | the capstone build | ⏳ |
| 100 | **THE ARCHITECT EXAM** 👑 | design + defend your own | ⏳ |
</details>

## 🎓 Along the way you also master
**Git** (every video: real commits, branches, PRs, signed commits, tags → releases) · **Registries** (Docker Hub → GHCR → self-hosted → Artifactory) · **Interview answers** (one architect line per image)

## 🔗 Connect
🎥 [YouTube — DevOps AI Kingdom](https://youtube.com/@devopsaikingdom) · 🌐 [devopsaikingdom.github.io](https://devopsaikingdom.github.io) · 💼 [LinkedIn](https://www.linkedin.com/in/himz)

**Secure · Scale · Automate 👑** — *Don't be the Same! Be Better!!!*
