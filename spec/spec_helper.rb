ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
# require 'rspec/rails'
# require 'rspec/autorun'
# require 'factory_girl_rails'
# require 'capybara/webkit/matchers'
# require 'capybara/rails'
# require 'capybara/rspec'
# require 'database_cleaner'

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'factory_girl_rails'

Capybara.javascript_driver = :webkit

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}



RSpec.configure do |config|

	config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = false
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  # Include path helpers

end