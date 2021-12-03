FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY . .

EXPOSE 8081
CMD [ "npx", "serve", "-p", "8081" ]
