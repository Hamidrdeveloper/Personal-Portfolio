FROM node:17-alpine as builder

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN rm -rf yarn.lock package-lock.json node_modules
RUN npm install 
RUN npm build 

FROM nginx:1.19.0
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/build .
COPY --from=builder /app/build build
ENTRYPOINT ["nginx", "-g", "daemon off;"]
#CMD ["yarn", "start"]
