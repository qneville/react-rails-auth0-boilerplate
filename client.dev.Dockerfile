# Use an official Node.js runtime as a parent image
FROM node:13.12.0-alpine

# Set the working directory to /app
WORKDIR /app/client
RUN echo 
COPY ./package*.json ../
COPY ./client/package*.json ./

# Install Node.js dependencies
RUN npm install

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run the React app
CMD ["npm", "start"]
