FROM node:lts-alpine
LABEL maintainer="steven.vandervegt@nedap.com"

ARG VUE_APP_DOORMAN_URL
RUN test -n "$VUE_APP_DOORMAN_URL"
ENV VUE_APP_DOORMAN_URL=$VUE_APP_DOORMA_URL

ARG VUE_APP_NETWORKMAP_URL
RUN test -n "$VUE_APP_NETWORKMAP_URL"
ENV VUE_APP_NETWORKMAP_URL=$VUE_APP_NETWORKMAP_URL

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]
