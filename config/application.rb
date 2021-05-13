require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SentryTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

  end
end

#    Sentry.init do |s_config|
#      s_config.dsn = 'https://bab891063fe2410d806335bc994de8c9@o562418.ingest.sentry.io/5700936'
#      s_config.breadcrumbs_logger = [:active_support_logger]
#
#      # Set tracesSampleRate to 1.0 to capture 100%
#      # of transactions for performance monitoring.
#      # We recommend adjusting this value in production
#      s_config.traces_sample_rate = 0.5
#      # or
#      s_config.traces_sampler = lambda do |context|
#        true
#      end
#    end
