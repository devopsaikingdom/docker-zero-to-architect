FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["curl", "-s"]
CMD ["https://httpbin.org/ip"]
