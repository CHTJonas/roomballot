threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
workers ENV.fetch("WEB_CONCURRENCY") { 1 }
# preload_app!

before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Don't be quiet
quiet false

prune_bundler

if ENV['APP_ROOT']
  # If there's an APP_ROOT, which there will be from Procofile, be sure to use it
  # as the directory for puma so it can restart properly with USR2/1
  directory ENV['APP_ROOT']
end
