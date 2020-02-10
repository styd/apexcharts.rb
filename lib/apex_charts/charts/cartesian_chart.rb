# frozen_string_literal: true

require_relative 'features/annotations'
require_relative 'features/mixable'
require_relative '../utils/hash'

module ApexCharts::Charts
  class CartesianChart < BaseChart
    include Features::Annotations
    include Features::Mixable
    include ApexCharts::Utils::Hash

    def initialize(outer_self, data, options={}, &block)
      @outer_self = outer_self
      options = deep_merge(
        camelize_keys(options),
        camelize_keys(more_options)
      )

      build_instance_variables if @outer_self

      instance_eval &block if block_given?

      options[:annotations] = @annotations if @annotations
      @series = build_series(data)
      @options = build_options(options)

      build_selection_range if brush?
    end

    def series_type
      ApexCharts::Series::CartesianSeries
    end

    def more_options
      {}
    end

    def method_missing(method, *args, &block)
      if @outer_self.respond_to?(method, true)
        @outer_self.send method, *args, &block
      else
        super
      end
    end

    def respond_to_missing?(method, *args)
      @outer_self.respond_to?(method, true) || super
    end

  protected

    def build_instance_variables
      (@outer_self.instance_variables - instance_variables).each do |i|
        instance_variable_set(i, @outer_self.instance_variable_get(i))
      end
    end

    def brush?
      @options[:chart][:brush]&.[](:enabled) &&
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
      ApexCharts::Utils::DateTime.convert(input)
    end
  end
end
