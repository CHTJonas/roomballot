module HerokuHelper
  def self.on_heroku?
    ENV['I_AM_HEROKU'] && ENV['I_AM_HEROKU'] == 'yes'
  end
end
