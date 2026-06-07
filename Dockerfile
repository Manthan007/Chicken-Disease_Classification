FROM python:3.12-slim-bookworm

WORKDIR /app

# Copy everything (including setup.py and requirements.txt)
COPY . .

# Now pip can find setup.py and install your package with -e .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]