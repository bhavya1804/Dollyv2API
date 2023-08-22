# Use the official Python image as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY . /app

# Install required dependencies
RUN apt-get update && \
    pip install -r requirements.txt

# Expose port 8000 for the FastAPI application
EXPOSE 8000

# Start the FastAPI application
CMD ["python", "app1.py", "0.0.0.0:8000"]