source 'https://rubygems.org'

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'mini_magick', '~> 4.8'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'high_voltage', '~> 3.0.0'
gem 'sidekiq'
gem 'clockwork'
gem 'puma_worker_killer'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'paranoia', '~> 2.4', '>= 2.4.1'
gem 'rack-timeout-puma', '~> 0.0.1'

group :deployment do
  gem 'redis', '~> 4.0'
  gem 'pg'
  gem 'sentry-raven'
end

group :development, :test do
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
