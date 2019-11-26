# nuts-doorman-app

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
VUE_APP_NUTS_DOORMAN_URL=http://discovery-development.nuts.nl VUE_APP_NUTS_NETWORKMAP_URL=http://discovery-development.nuts.nl npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Run your unit tests
```
npm run test:unit
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

## Docker

Build image:
```
docker build -t nutsfoundation/nuts-doorman-app:latest-dev -f docker/Dockerfile .
```

Run with correct backend endpoints:
```
docker run -p 8081:8080 --env NUTS_NETWORKMAP_URL=discovery-development.nuts.nl --env NUTS_DOORMAN_URL=discovery.nuts.nl nutsfoundation/nuts-doorman-app:latest-dev
```