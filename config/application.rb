require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YallaNotlob
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.middleware.use Rack::TempfileReaper

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
Rails.application.config.assets.precompile += ['orderDetails.js', 'orderDetails.css']
Rails.application.config.assets.precompile += ['addOrder.js', 'order.css']
Rails.application.config.assets.precompile += ['signin.css']
Rails.application.config.assets.precompile += ['signup.css', 'home.css', 'friends.css', 'friends.js']
Rails.application.config.assets.precompile += ['groups.js', 'groups.css']


