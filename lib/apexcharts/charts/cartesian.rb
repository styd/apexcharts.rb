# frozen_string_literal: true

require_relative 'features/annotations'
require_relative 'features/mixable'
require_relative '../utils/hash'

module ApexCharts
  class CartesianChart < BaseChart
    include Annotations
    include Mixable
    include Utils::Hash

    def initialize(bindings, data, options={}, &block)
      @bindings = bindings
      options = deep_merge(
        camelize_keys(options),
        camelize_keys(more_options)
      )

      build_instance_variables if @bindings

      instance_eval &block if block_given?

      options[:annotations] = @annotations if @annotations
      @series = sanitize_data(data)
      @options = deep_merge(
        build_options(x_sample, options),
        camelize_keys(
          {**@series, chart: {type: chart_type}}.compact
        )
      )

      build_selection_range if brush?
    end

    def more_options
      {}
    end

    def method_missing(method, *args, &block)
      if @bindings.respond_to?(method)
        @bindings.send method, *args, &block
      else
        super
      end
    end

    def respond_to_missing?(method, *args)
      @bindings.respond_to?(method) || super
    end

  protected

    def build_instance_variables
      (@bindings.instance_variables - instance_variables).each do |i|
        instance_variable_set(i, @bindings.instance_variable_get(i))
      end
    end

    def sanitize_data(data)
      ApexCharts::CartesianSeries.new(data).sanitized
    end

    def brush?
      @options[:chart][:brush]&.[](:enabled) && \
        !@options[:chart][:selection]&.[](:xaxis)
    end

    def build_selection_range
      last_data = @series[:series].last[:data]
      first_x = last_data.first[:x]
      last_x = last_data.last[:x]
      @options[:chart][:selection][:xaxis] = {
        min: handle_time(twenty_percent_before_last_x(first_x, last_x)),
        max: handle_time(last_x)
      }
    end

    def twenty_percent_before_last_x(first, last)
      last - (0.2 * (last - first))
    end

    def handle_time(input)
      Utils::DateTime.convert(input)
    end
  end
end
