# Use an official Node runtime as a parent image
FROM node:14


# Install app dependencies
RUN npm install
RUN npm run build
FROM nginx:alpine
COPY /build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
