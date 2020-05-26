require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DevCamp2020Spring
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil


    # --------------------------------------------------------------------------
    # Timezone
    # --------------------------------------------------------------------------
    config.time_zone = 'Asia/Tokyo'
    config.active_record.time_zone_aware_types = [:datetime, :time]


    # --------------------------------------------------------------------------
    # Routing
    # --------------------------------------------------------------------------
    # config.paths['config/routes.rb'].concat Dir[Rails.root.join('config/routes/*.rb')]
    config.paths['config/routes.rb'].concat Dir['config/routes/**/*.rb']


    # --------------------------------------------------------------------------
    # Loading files
    # --------------------------------------------------------------------------
    config.paths.add 'lib', eager_load: true


    # --------------------------------------------------------------------------
    # i18n
    # --------------------------------------------------------------------------
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # --------------------------------------------------------------------------
    # ActiveJob
    # --------------------------------------------------------------------------
    config.active_job.queue_adapter = :sidekiq
  end
end
