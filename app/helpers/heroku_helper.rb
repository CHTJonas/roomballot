module HerokuHelper
  def self.on_heroku?
    ENV['I_AM_HEROKU'].present? && ENV['I_AM_HEROKU'] == 'yes'
  end
end
