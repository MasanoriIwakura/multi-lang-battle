FROM alpine:3.11 as base
LABEL maintainer "MasanoriIwakura"

RUN apk update \
    && apk add --no-cach make

FROM base as c-common

RUN apk add --no-cache gcc libc-dev

FROM c-common as c-lang
COPY ./apps/c-lang /apps/c-lang
WORKDIR /apps/c-lang/

FROM c-common as cpp
RUN apk add --no-cache g++
COPY ./apps/cpp /apps/cpp
WORKDIR /apps/cpp/

FROM base as go

ENV GO_VERSION 1.14.1
RUN apk add --no-cache wget && \
    wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
ENV PATH $PATH:/usr/local/go/bin
RUN go version
WORKDIR /apps/go
