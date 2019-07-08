require_relative 'features/annotations'

module Apexcharts
  class CartesianChart < BaseChart
    include Annotations

    def initialize bindings, data, options={}, &block
      @bindings = bindings
      options = {**options, **more_options}
      build_instance_variables if @bindings

      instance_eval &block if block_given?

      options[:annotations] = @annotations if @annotations
      @series = sanitize_data(data)
      @options = Utils::Hash.camelize_keys(
                   Utils::Hash.deep_merge(
                     build_options(x_sample, options),
                     {**@series, chart: {type: chart_type}}.compact
                   )
                 )

      get_selection_range if brush?
    end

    def chart_type
    end

    def more_options
      {}
    end

    def mixed_series
      @series[:series].each{|d| d.merge!(type: chart_type) }
      @series[:series]
    end

    def method_missing method, *args, &block
      if @bindings
        @bindings.send method, *args, &block
      else
        super
      end
    end

  protected

    def build_instance_variables
      (@bindings.instance_variables - instance_variables).each do |i|
        instance_variable_set(i, @bindings.instance_variable_get(i))
      end
    end

    def sanitize_data(data)
      Apexcharts::CartesianSeries.new(data).sanitized
    end

    def brush?
      @options[:chart][:brush]&.[](:enabled) && \
        !@options[:chart][:selection]&.[](:xaxis)
    end

    def get_selection_range
      first_x = @series[:series].last[:data].first[:x]
      last_x = @series[:series].last[:data].last[:x]
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

