# Use the official Python image as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install required dependencies
RUN pip install -r requirements.txt

# Copy the Python script and the model file into the container
COPY app.py .

# Expose port 8000 for the FastAPI application
EXPOSE 8000

# Start the FastAPI application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]