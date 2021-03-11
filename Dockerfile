ARG FENNEL_VERSION=0.8.1

FROM alpine:edge AS base
ARG FENNEL_VERSION

RUN apk update \
    && apk upgrade \
    && apk --update-cache add --no-cache \
    curl \
    lua5.3 \
    lua5.3-dev \
    luarocks \
    && rm -rf \
    /var/cache/apk/* \
    /root/.cache/luarocks

WORKDIR /usr/bin

RUN ln -s lua5.3 lua \
    && ln -s luarocks-5.3 luarocks

RUN curl -o fennel "https://fennel-lang.org/downloads/fennel-${FENNEL_VERSION}" \
    && chmod a+x fennel

WORKDIR /
