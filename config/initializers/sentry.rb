require 'raven'
require 'roomballot/version'

def configure_sentry
  if ENV['ENABLE_SENTRY'].present?
    Raven.configure do |config|
      config.dsn = Rails.application.secrets[:sentry_dsn]
      config.release = Roomballot::VERSION

      # Sanitize fields based on those sanitized from Rails.
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
      # Sanitize authentication headers
      config.sanitize_http_headers = %w[Authorization Private-Token]
    end
  end
end

configure_sentry if Rails.env.production?
