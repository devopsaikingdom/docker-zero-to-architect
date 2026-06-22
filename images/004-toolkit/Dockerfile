FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       curl \
       jq \
       ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY fetch-fact.sh /usr/local/bin/fetch-fact.sh
RUN chmod +x /usr/local/bin/fetch-fact.sh

CMD ["fetch-fact.sh"]
