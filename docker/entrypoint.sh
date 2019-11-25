#!/bin/sh
for file in /app/js/app.*.js;
do
  if [ ! -f $file.tmpl.js ]; then
    cp $file $file.tmpl.js
  fi
  echo "substituting $file"
  envsubst '$NUTS_NETWORKMAP_URL,$NUTS_DOORMAN_URL' < $file.tmpl.js > $file
done
echo "Starting Nginx"
exec nginx -g 'daemon off;'