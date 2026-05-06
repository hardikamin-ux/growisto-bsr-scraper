FROM mcr.microsoft.com/playwright/python:v1.40.0-jammy

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && playwright install chromium

COPY . .

EXPOSE 8501

CMD streamlit run app.py --server.port $PORT --server.address 0.0.0.0 --server.headless true
