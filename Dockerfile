FROM python:3.11-alpine

WORKDIR /app
RUN pip install --no-cache-dir poetry

COPY pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false \
    && poetry install

COPY . .

ENV DB_PORT=5432
EXPOSE 8080

CMD ["python", "app.py"]
