require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Gallery
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.active_job.queue_adapter = :resque
    # $redis = Resque.redis = Redis.new
    
    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru
  end
end
