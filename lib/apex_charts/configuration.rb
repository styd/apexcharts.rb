# frozen_string_literal: true

require_relative 'config/default_options'
require_relative 'config/schema'

module ApexCharts
  class << self
    attr_writer :helper_prefix

    def helper_prefix
      @helper_prefix ||= ENV['APEXCHARTS_PREFIX']
    end

    def configure
      block_given? ? yield(config) : config
    end

    def config
      @config ||= Configuration.new
    end
  end

  class Configuration
    include ApexCharts::Config::DefaultOptions
    include ApexCharts::Config::Schema
  end
end
