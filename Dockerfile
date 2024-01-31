# Use an official Node runtime as a parent image
FROM node:17-alpine as build

# Set the working directory


# Install dependencies
RUN npm install --force



# Build the React app
RUN npm run build


