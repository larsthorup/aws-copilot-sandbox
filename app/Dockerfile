FROM nginx

# Create app directory
WORKDIR /usr/src/app

# Get code
COPY script/* .
COPY src /usr/share/nginx/html

CMD ["sh", "start-nginx.sh"]