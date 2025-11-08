# Use an official Node.js base image
FROM node:24-alpine

RUN apk add go git
# Set the working directory
COPY ./player /var/www/demo
WORKDIR /var/www/demo

# Install global dependencies
RUN npm install -g pm2 npm

WORKDIR /var/www/demo
# Install project dependencies
RUN npm install

# Expose the desired port
EXPOSE 3000

CMD ["npx", "nuxi", "preview"]
