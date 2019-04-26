FROM ruby:2.5.3-alpine

# postgresql-client - for `rails db`
# less - for pry
RUN apk update && apk add build-base nodejs postgresql-dev postgresql-client git tzdata yarn less

WORKDIR /app

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
# Bundle installs with binstubs to our custom /bundle/bin volume path. Let system use those stubs.

CMD rm -f tmp/pids/server.pid && rails s -b 0.0.0.0
