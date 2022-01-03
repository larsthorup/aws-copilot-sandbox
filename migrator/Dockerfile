FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Get code
COPY . .

# Install dependencies
RUN npm install

# Wait until pg is running, then migrate
CMD [ "sh", "-c", "sleep 5; npm start" ]
