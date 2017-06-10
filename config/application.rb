require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jawhar
  class Application < Rails::Application
  	require 'carrierwave/orm/activerecord'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

 #    Raven.configure do |config|
	#   config.dsn = 'https://e885237485124149b5cf1f7cea06ec27:16a09e3cba594334a51e96ecaba27be7@sentry.io/178313'
	# end
  end
end
