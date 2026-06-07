FROM python:3.12-slim-bookworm

# Install system dependencies
RUN apt update -y && apt install awscli -y

WORKDIR /app

# Copy all local project files into the container
COPY . /app

# Install dependencies and your local package
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install .

CMD ["python3", "app.py"]