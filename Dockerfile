FROM ubuntu:18.04 as base
LABEL maintainer "MasanoriIwakura"

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y make

FROM base as c-common

RUN apt-get install -y apt-utils build-essential gcc

FROM c-common as c-lang
COPY ./apps/c-lang /apps/c-lang
WORKDIR /apps/c-lang/

FROM c-common as cpp
COPY ./apps/cpp /apps/cpp
WORKDIR /apps/cpp/

FROM base as go

ENV GO_VERSION 1.14.1
RUN apt-get install -y wget && \
    wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin
RUN go version
WORKDIR /apps/go/

FROM base as java
RUN apt-get install -y openjdk-8-jdk
COPY ./apps/java /apps/java
WORKDIR /apps/java/
