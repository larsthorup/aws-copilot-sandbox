FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Get app bundle
COPY dist .

EXPOSE 8081
CMD [ "npx", "serve", "-p", "8081" ]
