ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:ucamraven, uid: 'chtj2')

  def sign_in_admin
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:ucamraven]
    get auth_callback_path(:ucamraven)
  end
end
