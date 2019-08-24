# frozen_string_literal: true

module ApexCharts
  class MixedCharts < BaseChart
    include Annotations

    def initialize(bindings, options={}, &block)
      @bindings = bindings
      @series = {series: []}
      options[:id] ||= apexcharts_id
      build_instance_variables

      instance_eval &block

      options[:annotations] = @annotations if @annotations
      @options = Utils::Hash.deep_merge(
                   build_options(x_sample, options),
                   Utils::Hash.camelize_keys(
                     chart: {type: 'area'}, **@series
                   )
                 )

      build_selection_range if brush?
    end

    def line_chart(data, options={}, &block)
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] += LineChart.new(bindings, data, options, &block).mixed_series
    end

    def area_chart(data, options={}, &block)
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] += AreaChart.new(bindings, data, options, &block).mixed_series
    end

    def bar_chart(data, options={}, &block)
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] += BarChart.new(bindings, data, options, &block).mixed_series
    end

    def column_chart(data, options={}, &block)
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] += ColumnChart.new(bindings, data, options, &block).mixed_series
    end

    def scatter_chart(data, options={}, &block)
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] += ScatterChart.new(bindings, data, options, &block).mixed_series
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

  private

    def build_instance_variables
      (@bindings.instance_variables - instance_variables).each do |i|
        instance_variable_set(i, @bindings.instance_variable_get(i))
      end
    end

    def brush?
      @options[:chart][:brush]&.[](:enabled) && \
        !@options[:chart][:selection]&.[](:xaxis)
    end

    def build_selection_range
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
