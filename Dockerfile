FROM ruby:2.5.3-alpine

# less - for pry
# postgresql-client - for `rails db`
RUN apk update && apk add build-base nodejs postgresql-dev git tzdata less yarn postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 5

COPY package.json yarn.lock ./
RUN yarn install --check-files

CMD rm -f tmp/pids/server.pid && rails s -b 0.0.0.0
