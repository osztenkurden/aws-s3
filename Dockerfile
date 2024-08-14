FROM node:20-alpine

LABEL version="1.0.0"

RUN apk --no-cache add curl

WORKDIR /usr/app
COPY ./ /usr/app
COPY ./entrypoint.sh /usr/app


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN chmod +x /usr/app/entrypoint.sh

ENTRYPOINT ["/usr/app/entrypoint.sh"]