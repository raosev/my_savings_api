FROM ruby:3.1.2-slim-buster

ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY:-}

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev vim

RUN useradd -c "My Savings API User" -d /usr/src/app -m -s /bin/bash app;
USER app

ENV WORK_DIR=/usr/src/app
WORKDIR ${WORK_DIR}

COPY --chown=app:app Gemfile* ./

RUN gem install bundler -v 2.3.19; \
    bundle config set force_ruby_platform true; \
    bundle install --jobs 20 --retry 5;

COPY --chown=app:app . .