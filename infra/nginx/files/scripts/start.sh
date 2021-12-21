#!/bin/sh
echo "Stating nginx.."
nginx -g 'daemon off;' &

i=$(pgrep nginx | wc -l)
echo $i
while [ $i -lt 3 ]
do
  i=$(pgrep nginx | wc -l)
  echo "Waiting for nginx.. PID: ${i}";
  sleep 1;
done

echo "Starting template.."
consul-template -template="/templates/default.ctmpl:/etc/nginx/nginx.conf:nginx -s reload"


