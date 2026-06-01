# Lesson 25: Push to ghcr.io: First Registry Push

## What You'll Learn
Push an image to GitHub Container Registry.

## Commands
```bash
docker build -t lesson25 .
echo $GITHUB_TOKEN | docker login ghcr.io -u devopsaikingdom --password-stdin
docker tag lesson25 ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
docker push ghcr.io/devopsaikingdom/docker-zero-to-architect:lesson25
```

## Explanation
Tier 1 capstone. Build → tag with registry prefix → login → push. Once pushed, anyone can pull. This is how CI/CD works: build → push to registry → deploy from registry.

## Architect Note
> In production: build → scan (Trivy) → sign (cosign) → push → deploy. We add scanning and signing in Tier 3.

---
[← Previous](../24/) | [Course Index](../../README.md) | 
