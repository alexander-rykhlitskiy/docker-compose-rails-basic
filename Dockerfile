FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base nodejs postgresql-dev git tzdata yarn

WORKDIR /app

# it invalidates Dockerfile cache after changing any line of code in the project
# COPY . .
COPY Gemfile Gemfile.lock ./
RUN bundle install -j5 --binstubs
COPY package.json yarn.lock ./
RUN yarn install

# https://docs.docker.com/compose/rails/
CMD rm -f tmp/pids/server.pid && rails s -b 0.0.0.0
