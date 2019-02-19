# Supported tags and respective `Dockerfile` links

- [`latest` (*latest/Dockerfile*)](https://github.com/SillyWhale/password-generator/blob/master/Dockerfile)

# Quick reference

- **Where to file issues**:  
  [https://github.com/SillyWhale/password-generator/issues](https://github.com/SillyWhale/password-generator/issues)

- **Maintained by**:  
  [SillyWhale](https://github.com/SillyWhale/password-generator)

- **Source of this description**:  
  [docs repo's directory](https://github.com/SillyWhale/_documentation)

- **Supported Docker versions**:  
  [the latest release](https://github.com/docker/docker-ce/releases/latest)

# What is password-generator ?

[password-generator](https://password-generator.info/) is a web based app to create secure passwords that are impossible to crack on your device without sending them across the Internet, and learn over 30 tricks to keep your passwords, accounts and documents safe.  

# How to use this image

## Usage

Use like you would any other base image:

```dockerfile
FROM alpine:3.9
LABEL maintainer="SillyWhale <contact@sillywhale.wtf>"

ENV PG_URL="https://github.com/davidtavarez/passwords" \
    PG_ROOT=/var/www/localhost/htdocs/

COPY includes/ /includes.d/

RUN \
  apk -U --no-cache upgrade && \
  apk -U --no-cache add nginx nginx-mod-http-js supervisor git && \
  git clone ${PG_URL} ${PG_ROOT} && \
  echo 'daemon off;' >> /etc/nginx/nginx.conf && \
  mkdir /run/nginx && \
  cp /includes.d/nginx.conf /etc/nginx/conf.d/default.conf && \
  cp /includes.d/supervisord.conf /usr/local/supervisord.conf && \
  cp /includes.d/entrypoint.sh /entrypoint.sh && \
  chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
```

This yields us a virtual image size of about 69MB image.

## Documentation

This image is well documented. [Check out the documentation](http://docs.sillywhale.wtf/password-generator/).

# License

This software was developped by [Misael TAVERAS](https://github.com/taverasmisael) and [David TAVAREZ](https://davidtavarez.github.io/) on [GitHub](https://github.com/davidtavarez/passwords). All rights is reserved according to no Licence presence in repository or on website.