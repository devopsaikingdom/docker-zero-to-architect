FROM alpine:3.20

RUN apk add --no-cache curl jq

COPY poker.sh /usr/local/bin/poker.sh
RUN chmod +x /usr/local/bin/poker.sh

ENTRYPOINT ["/usr/local/bin/poker.sh"]
CMD ["https://jsonplaceholder.typicode.com/todos/1"]
