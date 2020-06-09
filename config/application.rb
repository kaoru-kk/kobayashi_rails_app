require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JumpMedia
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local

    config.paths.add 'lib', eager_load: true
  end
end
