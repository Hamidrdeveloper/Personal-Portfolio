# Stage 1: Build the Node.js application
FROM node:14-slim
# Set the working directory

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install --force

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Use Nginx to serve the built artifacts
FROM nginx:alpine

# Copy the built artifacts from the builder stage to the nginx directory
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# CMD is not needed as nginx image's default CMD is to start nginx
