FROM python:3.11 AS bloated
WORKDIR /app
COPY app.py .

FROM python:3.11-slim AS optimized
WORKDIR /app
COPY app.py .

FROM python:3.11-alpine AS tiny
WORKDIR /app
COPY app.py .
