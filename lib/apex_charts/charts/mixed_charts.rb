# frozen_string_literal: true

require_relative 'features/annotations'

module ApexCharts::Charts
  class MixedCharts < BaseChart
    include Features::Annotations
    include ApexCharts::Utils::Hash

    def initialize(outer_self, options={}, &block)
      @outer_self = outer_self
      @series = {series: []}
      options[:id] ||= apexcharts_id
      build_instance_variables

      instance_eval &block

      options[:annotations] = @annotations if @annotations
      @options = build_options(options)

      build_selection_range if brush?
    end

    def chart_type
      'area' # chosen default
    end

    def line_chart(data, options={}, &block)
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] +=
        LineChart.new(outer_self, data, options, &block).mixed_series
    end

    def area_chart(data, options={}, &block)
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] +=
        AreaChart.new(outer_self, data, options, &block).mixed_series
    end

    def bar_chart(data, options={}, &block)
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] +=
        BarChart.new(outer_self, data, options, &block).mixed_series
    end

    def column_chart(data, options={}, &block)
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] +=
        ColumnChart.new(outer_self, data, options, &block).mixed_series
    end

    def scatter_chart(data, options={}, &block)
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @series[:series] +=
        ScatterChart.new(outer_self, data, options, &block).mixed_series
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

  private

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
