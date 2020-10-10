# frozen_string_literal: true

require 'simplecov'
require 'simplecov-lcov'

if ENV['CI']
  SimpleCov::Formatter::LcovFormatter.config do |config|
    config.report_with_single_file = true
    config.single_report_path = "coverage/lcov.info"
  end
  SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
else
  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
end

SimpleCov.start do
  add_filter ['/spec/', '/lib/apexcharts/support', '/examples/']
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

require 'apex_charts/helper'

def id_fiber
  @id_fiber ||= Fiber.new do
    Fiber.yield 'chart-1'
    Fiber.yield 'chart-2'
  end
end

def apexcharts_id
  id_fiber.resume
end
