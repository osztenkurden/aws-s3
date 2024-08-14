FROM node:20-alpine

LABEL version="1.0.0"

RUN apk --no-cache add curl
RUN apk add --no-cache aws-cli

WORKDIR /usr/app
COPY ./ /usr/app
COPY ./entrypoint.sh /usr/app

RUN chmod +x /usr/app/entrypoint.sh

ENTRYPOINT ["/usr/app/entrypoint.sh"]