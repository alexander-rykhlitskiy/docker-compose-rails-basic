FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base nodejs postgresql-dev git tzdata

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

RUN rm -f tmp/pids/server.pid
CMD rails s -b 0.0.0.0
