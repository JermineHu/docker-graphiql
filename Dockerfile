FROM alpine:edge
MAINTAINER Jermine <Jermine.hu@qq.com>
ENV VERSION=v8.5.0 NPM_VERSION=5 YARN_VERSION=latest

RUN apk add git=2.14.1-r1 \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --no-cache ; \
    apk add nodejs=current-8.5.0-r0  \
    --repository http://http://dl-4.alpinelinux.org/alpine/edge/community \
    --no-cache ; \

  git clone https://github.com/graphql/graphiql.git /app ; \

  apk del git ${DEL_PKGS} && \
  rm -rf ${RM_DIRS} /usr/share/man /tmp/* /var/cache/apk/* /app/.git \
    /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts

WORKDIR /app
RUN npm install

EXPOSE 3000
CMD npm start
