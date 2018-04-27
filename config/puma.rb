threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
bind "tcp://" + ENV.fetch("IP") { "127.0.0.1" } + ":" + ENV.fetch("PORT") { 3000 }.to_s
environment ENV.fetch("RAILS_ENV") { "development" }
workers ENV.fetch("WEB_CONCURRENCY") { 1 }

# Preload the app to reduce CPU and memory pressure.
# If you really need zero downtime phased-restarts you
# will need to disable this option.
preload_app!

before_fork do
  require 'puma_worker_killer'
  require 'raven'
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
  # Kill runaway Puma workers that consume too much memory
  # You can customise the defaults values in your Procfile.local file
  PumaWorkerKiller.config do |config|
    config.ram           = ENV.fetch("PWK_RAM") { 512 }.to_i       # mb
    config.frequency     = ENV.fetch("PWK_FREQUENCY") { 10 }.to_i  # seconds
    config.percent_usage = 0.98
    config.rolling_restart_frequency = 6 * 3600 # 6 hours in seconds
    config.reaper_status_logs = false
    config.pre_term = -> (worker) { Raven.capture_message("Puma worker killed", :level => 'info') if ENV['ENABLE_SENTRY'].present? }
  end
  PumaWorkerKiller.start
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
