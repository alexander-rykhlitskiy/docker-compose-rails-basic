# https://github.com/mperham/sidekiq/wiki/Using-Redis

redis_config = {
  url: ENV['REDIS_URL'] || 'redis://127.0.0.1:6379/0'
}

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
