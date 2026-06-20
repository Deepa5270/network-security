FROM python:3.11-slim-bullseye
WORKDIR /app
COPY . /app

RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 8000
CMD ["python3", "app.py"]
