FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Get code
COPY . .

# Install dependencies
RUN npm install

EXPOSE ${API_PORT}
CMD [ "npm", "start" ]
