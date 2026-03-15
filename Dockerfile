# Use a specific version of the Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies specified in package.json
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

ARG MONGO_URI
ARG JWT_SECRET
ARG PORT
ARG NODE_ENV
ARG BASE_URL

ENV MONGO_URI=$MONGO_URI
ENV JWT_SECRET=$JWT_SECRET
ENV PORT=$PORT
ENV NODE_ENV=$NODE_ENV
ENV BASE_URL=$BASE_URL

EXPOSE 3000

CMD ["node", "src/server.js"]
