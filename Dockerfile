# Use the official Node.js 14 image as the base image
FROM node:16

# Install jq for JSON parsing
RUN apt-get update && apt-get install -y jq

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Run the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
