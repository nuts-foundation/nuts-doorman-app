# nuts-doorman-app

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
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
docker run -p 8081:8080 --env VUE_APP_NETWORKMAP_URL=34.90.36.239:8080 --env VUE_APP_DOORMAN_URL=34.90.36.239:8080 nutsfoundation/nuts-doorman-app:latest-dev
```