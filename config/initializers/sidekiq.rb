# ==============================================================================
# config - initializers - sidekiq
# ==============================================================================
require 'sidekiq/api'
require 'sidekiq-status'

namespace = [
  Rails.application.class.module_parent_name,
  Rails.env,
  'sidekiq',
].join(':')

redis_setting = {
  namespace: namespace,
  url: Settings.redis.url,
}

Sidekiq.configure_server do |config|
  config.redis = redis_setting
  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes
  end
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes
  end
  config.error_handlers << proc do |ex, ctx_hash|
    Sidekiq.logger.warn "Error! #{ex} #{ctx_hash}"
  end
end

Sidekiq.configure_client do |config|
  config.redis = redis_setting
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes
  end
end
