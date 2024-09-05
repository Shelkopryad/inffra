FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ARG RUBY_VERSION=2.7.4
ARG RUBY_GEMSET=test_rails_dockerized
ARG BUNDLER_VERSION=2.4.22

RUN apt-get clean && apt-get update -qq && apt-get install -yq --no-install-recommends  \
    software-properties-common \
    build-essential \
    libcurl4-openssl-dev \
    less \
    ssh-client \
    shared-mime-info \
    libssl1.0.0 \
    git \
    gcc \
    gnupg2 \
    curl \
    libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

SHELL ["/bin/bash", "-l", "-c"]

RUN gpg --keyserver-options auto-key-retrieve --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

RUN curl -sSL https://get.rvm.io | bash -s stable

WORKDIR /app
ADD https://github.com/Shelkopryad/inffra/commits /dev/null

COPY Gemfile Gemfile.lock /app/

RUN source /usr/local/rvm/scripts/rvm && \
    rvm install $RUBY_VERSION && \
    rvm use $RUBY_VERSION@$RUBY_GEMSET --create

RUN source /usr/local/rvm/scripts/rvm && gem install bundler -v $BUNDLER_VERSION --no-document

COPY . /app
RUN bin/bundle config build.ffi -- --with-cflags=-Wno-implicit-function-declaration && bin/bundle install

EXPOSE 3000
