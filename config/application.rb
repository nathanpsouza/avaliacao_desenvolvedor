require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestNama
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'pt-BR'

    # Do not generate specs for views and requests. Also, do not generate assets.
    config.generators do |g|
      g.helper false
      g.view_specs false
      g.assets false
      g.integration_tool false
    end

    config.app_generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths << Rails.root.join('lib')
  end
end
