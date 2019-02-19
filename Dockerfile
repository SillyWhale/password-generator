FROM alpine:3.9
LABEL maintainer="SillyWhale <contact@sillywhale.wtf>"

ENV PG_URL="https://github.com/davidtavarez/passwords" \
    PG_ROOT=/var/www/localhost/htdocs/

COPY includes/ /includes.d/

RUN \
  apk -U --no-cache upgrade && \
  apk -U --no-cache add nginx nginx-mod-http-js supervisor git

RUN \
  git clone ${PG_URL} ${PG_ROOT}

RUN \
  echo 'daemon off;' >> /etc/nginx/nginx.conf && \
  mkdir /run/nginx && \
  cp /includes.d/nginx.conf /etc/nginx/conf.d/default.conf && \
  cp /includes.d/supervisord.conf /usr/local/supervisord.conf && \
  cp /includes.d/entrypoint.sh /entrypoint.sh && \
  chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]