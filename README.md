# Docker Compose config for Rails app

## Create files with current user as owner on Linux

Use `UID` and `--user` flag on Linux as follows, so docker creates files with host user as the owner
https://github.com/docker/compose/issues/1532

```bash
UID=$(id -u) docker-compose up
docker-compose run --user "$(id -u):$(id -g)" website touch test1
```

## Debugging with pry
Two options:

1. Attach to running server container with
```bash
docker attach $(docker-compose ps | grep website_1 | awk '{print $1}')
```
2. Run server with this command instead of `docker-compose up`
```bash
docker-compose run --user "$(id -u):$(id -g)" --use-aliases --service-ports website
```

## Sources

Base structure from
https://nickjanetakis.com/blog/dockerize-a-rails-5-postgres-redis-sidekiq-action-cable-app-with-docker-compose

`database.yml` and some other configs from
https://github.com/nickjj/orats

Some hints (`rm pidfile`) from
https://docs.docker.com/compose/rails/
