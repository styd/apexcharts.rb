module Apexcharts
  class SyncingChart
    def initialize bindings, options={}, &block
      @bindings = bindings
      @html = ""
      build_instance_variables
      @options = options
      @options[:group] ||= apexcharts_group

      instance_eval &block

      @options[:annotations] = @annotations if @annotations
    end

    def line_chart data, options={}, &block
      options[:id] = apexcharts_id
      bindings = eval("self", block.binding) if block_given?
      @html += LineChart.new(bindings, data, @options.merge(options), &block).render
    end

    def area_chart data, options={}, &block
      options[:id] = apexcharts_id
      bindings = eval("self", block.binding) if block_given?
      @html += AreaChart.new(bindings, data, @options.merge(options), &block).render
    end

    def bar_chart data, options={}, &block
      options[:id] = apexcharts_id
      bindings = eval("self", block.binding) if block_given?
      @html += BarChart.new(bindings, data, @options.merge(options), &block).render
    end

    def column_chart data, options={}, &block
      options[:id] = apexcharts_id
      bindings = eval("self", block.binding) if block_given?
      @html += ColumnChart.new(bindings, data, @options.merge(options), &block).render
    end

    def scatter_chart data, options={}, &block
      options[:id] = apexcharts_id
      bindings = eval("self", block.binding) if block_given?
      @html += ScatterChart.new(bindings, data, @options.merge(options), &block).render
    end

    def mixed_chart options={}, &block
      options[:id] = apexcharts_id
      bindings = eval "self", block.binding
      @html += MixedChart.new(bindings, @options.merge(options), &block).render
    end
    alias_method :combo_chart, :mixed_chart

    def render
      @html
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
