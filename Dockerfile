FROM ubuntu:18.04 as base
LABEL maintainer "MasanoriIwakura"

RUN apt-get update && apt-get upgrade -y \
    && mkdir /fixtures

COPY ./create_file.sh /
RUN /create_file.sh

FROM base as c-common

RUN apt-get install -y apt-utils build-essential gcc

FROM c-common as c-lang
COPY ./apps/c-lang /apps/c-lang
WORKDIR /apps/c-lang/

FROM c-common as cpp
COPY ./apps/cpp /apps/cpp
WORKDIR /apps/cpp/
