FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Remove the default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/sites-enabled/

# Expose port 80
EXPOSE 80
EXPOSE 5000

# Start Nginx and the Flask app
CMD service nginx start && gunicorn --workers 3 --bind 0.0.0.0:5000 app:app
