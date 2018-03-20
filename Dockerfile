FROM alpine:3.5

ADD . /go-ubiq
RUN \
  apk add --update git go make gcc musl-dev linux-headers && \
  (cd go-ubiq && make gubiq)                           && \
  cp go-ubiq/build/bin/gubiq /usr/local/bin/           && \
  apk del git go make gcc musl-dev linux-headers          && \
  rm -rf /go-ubiq && rm -rf /var/cache/apk/*

EXPOSE 8545
EXPOSE 30303
EXPOSE 30303/udp

ENTRYPOINT ["gubiq"]
