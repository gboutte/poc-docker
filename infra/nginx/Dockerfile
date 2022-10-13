FROM nginx:1.23.1-alpine

RUN apk add --no-cache tzdata
ENV TZ=Europe/Paris

RUN apk add --no-cache --virtual unzip
COPY ./infra/nginx/consul-template_0.27.2_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul-template_0.27.2_linux_amd64.zip -d /usr/local/bin


COPY ./infra/nginx/files/default.ctmpl /templates/
COPY ./infra/nginx/files/scripts/* /bin/
RUN chmod +x /bin/start.sh

COPY ./project/ /var/www

WORKDIR /var/www
EXPOSE 80
ENTRYPOINT ["/bin/start.sh"]