FROM python:3.11-slim
ARG APP_VERSION=1.0.0
ENV APP_NAME="DevOps AI Kingdom" \
    APP_VERSION=${APP_VERSION} \
    APP_ENV=production
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]
