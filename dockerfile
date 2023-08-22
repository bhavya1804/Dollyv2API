# Stage 1: Build the Python environment and install dependencies
FROM python:3.8-slim AS base

WORKDIR /app

# Copy requirements.txt to the working directory
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Load the model and setup the API
FROM base AS api

# Copy the rest of the application code
COPY . .

# Expose the port the API will run on
EXPOSE 80

# Command to run the API
CMD ["python", "app.py", "0.0.0.0:80"]
