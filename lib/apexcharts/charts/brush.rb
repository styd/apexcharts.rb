module Apexcharts
  class BrushChart
    def initialize target, bindings, options, &block
      @bindings = bindings
      options[:id] ||= apexcharts_id
      @options = {
        **options,
        chart: {
          height: 180,
          brush: {
            enabled: true,
            target: target.to_s
          },
          selection: {
            enabled: true
          }
        }
      }
      build_instance_variables

      instance_eval &block
    end

    def line_chart data, options={}, &block
      @chart = LineChart.new(data, @options.merge(options), &block)
    end

    def area_chart data, options={}, &block
      @chart = AreaChart.new(data, @options.merge(options), &block)
    end

    def bar_chart data, options={}, &block
      @chart = BarChart.new(data, @options.merge(options), &block)
    end

    def column_chart data, options={}, &block
      @chart = ColumnChart.new(data, @options.merge(options), &block)
    end

    def scatter_chart data, options={}, &block
      @chart = ScatterChart.new(data, @options.merge(options), &block)
    end

    def mixed_chart options={}, &block
      bindings = eval "self", block.binding
      @chart = MixedChart.new(bindings, @options.merge(options), &block)
    end
    alias_method :combo_chart, :mixed_chart

    def render
      @chart.render
    end

    def method_missing method, *args, &block
      @bindings.send method, *args, &block
    end

  private

    def build_instance_variables
      (@bindings.instance_variables - instance_variables).each do |i|
        instance_variable_set(i, @bindings.instance_variable_get(i))
      end
    end
  end
end
