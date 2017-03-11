ENV['RAILS_ENV'] ||= 'test'
if ENV['RCOV'].to_s.downcase == 'true'
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start do
    add_filter '/app/channels/'
    add_filter '/app/jobs/'
    add_filter 'app/models/application_record'
    add_filter '/app/mailers/'
    add_filter '/config/'
    add_filter '/spec/'

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Helpers', 'app/helpers'
    add_group 'Libraries', 'lib'
  end
end
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.order = :random
  config.default_formatter = :doc if config.files_to_run.one?

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    images_dir = Rails.root.join("public", "images", "g4a", "01").to_s
    unless File.directory?(images_dir)
      FileUtils.mkdir_p(images_dir)
      fixtures_images_dir = Rails.root.join("spec", "fixtures", "images", "g4a", "01", "*").to_s
      FileUtils.cp_r(Dir[fixtures_images_dir], images_dir)
    end
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :deletion : :transaction
    DatabaseCleaner.start
    FactoryGirl.reload
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
