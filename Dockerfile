FROM python:3.7-alpine

WORKDIR /app

RUN apk add --no-cache build-base libffi-dev openssl-dev \
    && pip install poetry

COPY poetry.lock poetry.lock
COPY pyproject.toml pyproject.toml

RUN poetry install -n --no-dev

COPY luna_price_exporter luna_price_exporter

ENTRYPOINT [ "poetry", "run", "luna-price-exporter"]