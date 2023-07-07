# Use the official nginx image as the base image
FROM nginx:latest

# Copy the custom Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Install Node.js
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Create a directory for the Node.js application
WORKDIR /app

# Copy the sample Node.js application to the container
COPY app.js package.json ./

# Install dependencies
RUN npm install

# Expose port 80 for the nginx server
EXPOSE 80

# Start nginx and run the Node.js application
CMD service nginx start && node app.js
