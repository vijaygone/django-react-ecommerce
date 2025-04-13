# Use an official Nginx image to serve the static files
FROM nginx:latest-alpine

# Copy the production build from the VM to the container
COPY dist /usr/share/nginx/html

# Expose the port Nginx runs on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]