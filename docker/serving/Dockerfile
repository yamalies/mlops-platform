FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/serving /app/serving
COPY models /app/models

EXPOSE 8080

CMD ["python", "serving/app.py"]
