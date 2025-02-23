FROM node:lts-alpine

RUN npm install -g http-server

RUN mkdir /app

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

ARG VUE_APP_HOST
ARG VUE_APP_PORT
ARG VUE_APP_PATH

# Establecer variables de entorno
ENV VUE_APP_HOST=$VUE_APP_HOST
ENV VUE_APP_PORT=$VUE_APP_PORT
ENV VUE_APP_PATH=$VUE_APP_PATH

EXPOSE 8080

CMD [ "http-server", "dist" ]