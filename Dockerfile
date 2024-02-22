# Use the official Node.js 14 image as the base image
FROM node:16

# Install qemu for multi-platform support
RUN apt-get update && apt-get install -y --no-install-recommends qemu-user-static

# Install buildx
RUN mkdir -p ~/.docker/cli-plugins && \
    wget -O ~/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/v0.5.1/buildx-v0.5.1.linux-amd64 && \
    chmod a+x ~/.docker/cli-plugins/docker-buildx

# Enable experimental features for Docker
RUN mkdir -p ~/.docker && \
    echo '{"experimental":"enabled"}' > ~/.docker/config.json

# Set up buildx
RUN docker run --privileged --rm tonistiigi/binfmt --install all

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Run the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
