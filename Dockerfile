# Use a specific platform/version for consistency
FROM python:3.12-slim-bookworm

# 1. Set environment variables to keep the container clean
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# 2. Install dependencies first (Optimization: Caching)
# Copy only requirements.txt first so Docker caches the installation layer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 3. Copy the rest of the application
COPY . .

# 4. Use a non-root user for security (Optional but recommended)
# RUN useradd -m myuser
# USER myuser

CMD ["python3", "app.py"]