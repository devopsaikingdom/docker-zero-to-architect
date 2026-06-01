# Docker Cheat Sheet — DevOps AI Kingdom

## Container Lifecycle
```bash
docker run IMAGE              # Create + start
docker run -d IMAGE           # Detached (background)
docker run -it IMAGE bash     # Interactive shell
docker run -p 8080:80 IMAGE   # Port mapping
docker run -v vol:/data IMAGE # Volume mount
docker run -e KEY=VAL IMAGE   # Environment variable
docker run --name NAME IMAGE  # Named container
docker ps                     # Running containers
docker ps -a                  # All containers
docker stop NAME              # Graceful stop (SIGTERM)
docker kill NAME              # Force stop (SIGKILL)
docker rm NAME                # Remove stopped container
docker container prune        # Remove all stopped
```

## Images
```bash
docker build -t NAME:TAG .    # Build from Dockerfile
docker images                 # List images
docker pull IMAGE:TAG         # Pull from registry
docker push IMAGE:TAG         # Push to registry
docker tag SRC DST            # Create new tag
docker history IMAGE          # Show layers
docker inspect IMAGE          # Full metadata JSON
docker rmi IMAGE              # Remove image
docker image prune            # Remove unused images
```

## Debugging
```bash
docker logs NAME              # View logs
docker logs -f NAME           # Follow logs
docker logs --tail 20 NAME    # Last 20 lines
docker exec -it NAME sh       # Shell into container
docker exec NAME CMD          # Run command inside
docker inspect NAME           # Full container metadata
docker stats                  # Live resource usage
docker top NAME               # Processes inside container
```

## Volumes & Networking
```bash
docker volume create VOL      # Create named volume
docker volume ls               # List volumes
docker volume inspect VOL     # Volume details
docker network create NET     # Create network
docker network ls              # List networks
docker port NAME              # Show port mappings
```

## Cleanup
```bash
docker system df              # Disk usage summary
docker system prune -f        # Remove ALL unused
docker system prune -a -f     # Remove ALL (including images)
docker volume prune -f        # Remove unused volumes
```

## Dockerfile Instructions
```dockerfile
FROM image:tag          # Base image
RUN command             # Execute during build
COPY src dest           # Copy files into image
WORKDIR /path           # Set working directory
ENV KEY=VALUE           # Runtime env variable
ARG KEY=VALUE           # Build-time variable
EXPOSE port             # Document port (metadata only)
CMD ["exec", "arg"]     # Default command (overridable)
ENTRYPOINT ["exec"]     # Fixed command (appendable)
HEALTHCHECK CMD cmd     # Container health check
LABEL key=value         # Image metadata
USER username           # Run as non-root
VOLUME /path            # Declare mount point
```
