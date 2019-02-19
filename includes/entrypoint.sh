#!/bin/sh

chown -R nginx:nginx /var/www/localhost/htdocs
supervisord -c /usr/local/supervisord.conf &
sleep 5
tail -f /supervisord.log /var/log/nginx/passgen_access.log /var/log/nginx/passgen_error.log