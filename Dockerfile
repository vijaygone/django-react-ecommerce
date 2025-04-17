# Use an official Nginx image to serve the static files
FROM public.ecr.aws/nginx/nginx:alpine-slim

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the production build from the VM to the container
COPY build /usr/share/nginx/html

# Expose the port Nginx runs on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]