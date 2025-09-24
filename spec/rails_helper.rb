# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # FactoryBot: permite usar `create(:user)` e `build(:user)` sem `FactoryBot.`
  config.include FactoryBot::Syntax::Methods

  # Devise helpers
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :controller

  # 🔑 Fix para mapping do Devise
  config.before(:each, type: :request) do
    if defined?(@request) && @request.present?
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end
  end

  # Fixture path
  config.fixture_path = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
end

# Shoulda Matchers
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
