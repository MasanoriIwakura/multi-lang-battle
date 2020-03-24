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

FROM base as python-build
ENV DEBIAN_FRONTEND=noniteractive
RUN apt-get -y install wget libbz2-dev libdb-dev \
    libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
    libncursesw5-dev libsqlite3-dev libssl-dev \
    zlib1g-dev uuid-dev tk-dev

RUN wget https://www.python.org/ftp/python/3.7.7/Python-3.7.7.tgz && tar xzf Python-3.7.7.tgz

RUN cd Python-3.7.7 && ./configure --enable-shared && make && make install \
    && sh -c "echo '/usr/local/lib' > /etc/ld.so.conf.d/custom_python3.conf" \
    && ldconfig

FROM base as python
COPY --from=python-build /usr/local/ /usr/local/
COPY --from=python-build /Python-3.7.7/libpython3.7m.so.1.0 /usr/lib/
COPY ./apps/python /apps/python
WORKDIR /apps/python/

