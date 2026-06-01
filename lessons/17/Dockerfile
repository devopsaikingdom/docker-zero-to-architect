FROM alpine:3.19
RUN apk add --no-cache python3
CMD ["python3", "-c", "import platform; print(f'Alpine {platform.system()} {platform.machine()}')"]
