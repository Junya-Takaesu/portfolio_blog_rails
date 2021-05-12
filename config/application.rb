require_relative "boot"

# -------- Custom Rails Setup start --------
# Disable all-in-one import,
# but rather import individual rails-related gems below
# require "rails/all"

# Commented active_record gem because
# this blog does not use active_record and database
# require "active_record/railtie"
# All these depend on active_record, so they should be excluded also
# require "active_storage/engine"
# require "action_mailbox/engine"
# require "action_text/engine"

# Use below rails-related gems for this rails application
require "active_model/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "active_job/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"
# -------- Custom Rails Setup end --------

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JTBlog
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

    # Disable it so the autoload paths for Zeitwerk are not gonna added to the $LOAD_PATH for ruby
    config.add_autoload_paths_to_load_path = false

    # Custom configuration
    config.site_name = "JT BLOG"
  end
end
