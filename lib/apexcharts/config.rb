# frozen_string_literal: true

require_relative 'config/default_options'

module ApexCharts
  class << self
    def helper_prefix
      @@helper_prefix ||= ENV['APEXCHARTS_PREFIX']
    end

    def helper_prefix=(prefix)
      @@helper_prefix = prefix
    end

    def configure
      block_given? ? yield(config) : config
    end

    def config
      @@config ||= Configuration.new
    end
  end

  class Configuration
    include DefaultOptions
  end
end
