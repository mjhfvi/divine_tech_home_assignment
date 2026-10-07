# FROM python:3.14.8-slim
FROM python:3.13.15-alpine

WORKDIR /app

COPY src/*.py requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt && rm /app/requirements.txt

# run Uvicorn without creating __pycache__ folders
ENV PYTHONDONTWRITEBYTECODE=1
ENV APP_PORT=8000

CMD uvicorn src.app:app --host 0.0.0.0 --port ${APP_PORT}
