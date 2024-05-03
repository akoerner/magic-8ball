FROM python:3.9-slim

WORKDIR /app

COPY requirements.pip3 /app
RUN pip install --no-cache-dir -r requirements.pip3


EXPOSE 5000

COPY *.py /app
COPY static /app/static
COPY templates /app/templates
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "magic-8ball:app"]
