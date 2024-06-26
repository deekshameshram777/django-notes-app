FROM python:3.9 AS builder

WORKDIR /app/backend

COPY requirements.txt /app/backend
RUN pip install -r requirements.txt
COPY . /app/backend
FROM python:3.9-slim
WORKDIR /app/backend
COPY --from=builder /app/backend /app/backend

EXPOSE 8000

CMD python /app/backend/manage.py runserver 0.0.0.0:8000
