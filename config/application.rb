# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ElectionWebApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.sass.preferred_syntax = :sass # allow to use sass over scss
    # config.generators.stylesheet_engine = :sass

    Dir[Rails.root.join("app", "assets", "assets", "**", "*")].each { |f| require f } # Add videos path

    # Add Factory Bot
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    # Add letter opner
    config.action_mailer.delivery_method = :letter_opener_web
    config.action_mailer.perform_deliveries = true
    # config.action_mailer.default_url_options = { host: "localhost:3000" }
  end
end
