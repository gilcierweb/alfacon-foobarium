FROM node:16-alpine

MAINTAINER GilcierWeb <gilcierweb@gmail.com>

ENV APP_HOME /app

RUN apk update && apk upgrade
RUN apk add git

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN node -v && yarn -v

COPY package*.json ./

COPY . $APP_HOME

RUN yarn install
RUN yarn run generate
RUN yarn build

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "yarn", "start" ]