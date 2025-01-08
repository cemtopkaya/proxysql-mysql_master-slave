require 'redis-rails'
 
Rails.application.config.session_store :redis_store,
    servers: {
      host: ENV['REDMINE_REDIS_HOST'] || 'redis',
      port: ENV['REDMINE_REDIS_PORT'] || 6379,
      db: ENV['REDMINE_REDIS_DB'] || 0,
      namespace: ENV['REDMINE_REDIS_NAMESPACE'] || "redmine:session"
    },
    expire_after: 8.hours,
    key: '_redmine_session'
