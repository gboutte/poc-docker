#!/bin/sh
nginx -g 'daemon off;' &
echo -n $LIVE > /var/live
consul-template -template="/templates/default.ctmpl:/etc/nginx/nginx.conf:nginx -s reload"