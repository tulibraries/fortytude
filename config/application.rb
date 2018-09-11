require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tude
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.tinymce.install

    config.generators do |g|
      g.test_framework :rspec, :spec => true
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.group_types = ["Assembly","Committee","Department","Functional Team","Strategic Steering Team","Working Group"]
    config.google_sheets_api_key = ENV["GOOGLE_SHEETS_API_KEY"]
  end
end
