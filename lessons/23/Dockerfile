FROM python:3.11-slim
WORKDIR /app
COPY app.py .
ENV APP_ENV=production DB_HOST=localhost
CMD ["python", "app.py"]
