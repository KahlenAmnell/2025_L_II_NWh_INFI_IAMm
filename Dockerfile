FROM python:3

ENV APP_DIR=/usr/src/hello_world_printer
# 2. Ustawiamy katalog roboczy (wszystkie komendy RUN/CMD wykonają się TUTAJ)
WORKDIR $APP_DIR

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY hello_world/ ./hello_world/
COPY main.py .

ENV FLASK_APP=hello_world
ENV PYTHONPATH=$APP_DIR

CMD ["flask", "run", "--host=0.0.0.0"]