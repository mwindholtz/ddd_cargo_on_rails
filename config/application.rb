require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rspec/core' if Rails.env.test? # needed before RSpec.configure

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tvd
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.generators do |g|
      g.test_framework :rspec
      g.orm :active_record  
      g.template_engine :erb
    end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    
    config.active_record.timestamped_migrations = false
		    
    # Add additional load paths for your own custom dirs
		config.autoload_paths += %W( #{Rails.root}/app/cmds
                              	 #{Rails.root}/app/presenters
                                 #{Rails.root}/app/rules
                                 #{Rails.root}/app/services
                              	 #{Rails.root}/app/models/support
                              )
		
  end
end
