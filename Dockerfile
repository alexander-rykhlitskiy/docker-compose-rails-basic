FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base nodejs postgresql-dev git tzdata less yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 5

COPY package.json yarn.lock ./
RUN yarn install

CMD rm -f tmp/pids/server.pid && rails s -b 0.0.0.0
