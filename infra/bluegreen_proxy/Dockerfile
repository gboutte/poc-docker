FROM nginx:1.20.2-alpine

COPY .htpasswd /etc/nginx/
RUN apk add --no-cache --virtual unzip
COPY consul-template_0.27.2_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul-template_0.27.2_linux_amd64.zip -d /usr/local/bin

COPY files/scripts/* /bin/
RUN chmod +x /bin/current-live /bin/switch /bin/start.sh
COPY files/default.ctmpl /templates/

ENV LIVE blue
ENV BLUE_NAME blue
ENV GREEN_NAME green

EXPOSE 80 8080
ENTRYPOINT ["/bin/start.sh"]