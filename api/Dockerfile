FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Get code
COPY . .

# Install dependencies
RUN npm install

# TODO: inject port number
EXPOSE 8081
CMD [ "npm", "start" ]
