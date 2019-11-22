#!/bin/sh
for file in /app/js/app.*.js;
do
  if [ ! -f $file.tmpl.js ]; then
    cp $file $file.tmpl.js
  fi
  echo "substituting $file"
  envsubst '$VUE_APP_NETWORKMAP_URL,$VUE_APP_DOORMAN_URL' < $file.tmpl.js > $file
done
echo "Starting Nginx"
exec nginx -g 'daemon off;'