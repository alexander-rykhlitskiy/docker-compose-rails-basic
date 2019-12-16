# Docker Compose config for Rails app

## Create files with current user as owner on Linux

Use `UID` (or `--user` in run) flag on Linux as follows, so docker creates files with host user as the owner
https://github.com/docker/compose/issues/1532

```bash
UID=$(id -u) docker-compose run website bin/install
```

## Debugging with pry
Two options:

1. Attach to running server container with
```bash
docker attach $(docker-compose ps | grep website_1 | awk '{print $1}')
```
2. Run server with this command instead of `docker-compose up`
```bash
UID=$(id -u) docker-compose run --use-aliases --service-ports website
```

## Running tests
See `spec/rails_helper.rb`

**You want to run feature tests in live mode and see how they go**\
Two options:
1. on your local machine
```bash
LIVE_CHROME=true rspec spec/features/reports_spec.rb
```
2. via VNC (not implemented) https://hub.docker.com/r/siomiz/chrome/

## Issues
* wkhtmltopdf
  * wkhtmltopdf-binary - "file not found", alpine doesn't have some shared libraries
  * apk add wkhtmltopdf - blank page rendered

## TODO
* remove password for postgres
* run chrome via VNC for tests

## Sources

Base structure
https://nickjanetakis.com/blog/dockerize-a-rails-5-postgres-redis-sidekiq-action-cable-app-with-docker-compose

`database.yml` and some other configs
https://github.com/nickjj/orats

Some hints (`rm pidfile`)
https://docs.docker.com/compose/rails/
