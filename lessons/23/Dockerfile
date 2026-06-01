FROM python:3.11-slim
WORKDIR /app
COPY config_app.py .
ENV APP_ENV=production \
    DB_HOST=localhost \
    DB_PORT=5432 \
    LOG_LEVEL=INFO
EXPOSE 8080
CMD ["python", "config_app.py"]
