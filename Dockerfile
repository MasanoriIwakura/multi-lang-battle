FROM ubuntu:18.04 as base
LABEL maintainer "MasanoriIwakura"

RUN apt-get update && apt-get upgrade -y

FROM base as c-lang

RUN apt-get install -y apt-utils build-essential gcc
COPY ./apps /apps
WORKDIR apps/c-lang/
