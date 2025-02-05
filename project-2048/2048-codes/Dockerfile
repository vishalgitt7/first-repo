# Use Python 3.11 slim image as the base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV FLASK_ENV=production

# Set the working directory
WORKDIR /app

# Install system dependencies (Nginx)
RUN apt-get update && apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*  # Clean up apt cache to reduce image size

# Remove the default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/sites-enabled/

# Copy the application code
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose ports
EXPOSE 80  # For Nginx
EXPOSE 5000  # For Gunicorn

# Start Nginx and Gunicorn
CMD service nginx start && gunicorn --workers 3 --bind 0.0.0.0:5000 app:app
