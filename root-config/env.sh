#!/bin/sh

# Replace environment variables in the HTML file
sed -i "s|{{VUE_APP_URL}}|$VUE_APP_URL|g" /usr/share/nginx/html/index.html
sed -i "s|{{REACT_APP_URL}}|$REACT_APP_URL|g" /usr/share/nginx/html/index.html
sed -i "s|{{VUE_PARCEL_URL}}|$VUE_PARCEL_URL|g" /usr/share/nginx/html/index.html
sed -i "s|{{REACT_PARCEL_URL}}|$REACT_PARCEL_URL|g" /usr/share/nginx/html/index.html

# Start Nginx
exec nginx -g 'daemon off;'