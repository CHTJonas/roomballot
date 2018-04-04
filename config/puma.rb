threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
workers ENV.fetch("WEB_CONCURRENCY") { 1 }

# Don't preload the app. Enabling this will reduce CPU and memory pressure
# when starting Puma workers at the disadvantage of disabling phased-restarts.
##preload_app!

before_fork do
  require 'puma_worker_killer'
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
  # Kill runaway Puma workers that consume too much memory
  # You can customise the defaults values in your Procfile.local file
  PumaWorkerKiller.config do |config|
    config.ram           = Float(ENV.fetch("PWK_RAM") { 1024 })      # mb
    config.frequency     = Float(ENV.fetch("PWK_FREQUENCY") { 5 })  # seconds
    config.percent_usage = 0.98
    config.reaper_status_logs = true
    # Enable this to get a full dump of a worker when it is killed
    ##config.pre_term = -> (worker) { puts "Worker #{worker.inspect} is being killed" }
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
