FROM ubuntu:22.04
RUN echo "Layer 1: update" && apt-get update
RUN echo "Layer 2: install" && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*
COPY hello.sh /hello.sh
RUN chmod +x /hello.sh
CMD ["/hello.sh"]
