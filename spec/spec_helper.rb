# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require "bundler"

Bundler.require :default,:development

Combustion.initialize! :action_controller

require "rspec/rails"

require "rails_namespace_path_helper"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end