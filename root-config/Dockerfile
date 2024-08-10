# production stage
FROM nginx:stable-alpine as production-stage

# Copy the HTML file and favicon
COPY index.html /usr/share/nginx/html
COPY favicon.ico /usr/share/nginx/html

# Copy the env.sh script
COPY env.sh /docker-entrypoint.d/40-env.sh

# Make the script executable
RUN chmod +x /docker-entrypoint.d/40-env.sh

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]