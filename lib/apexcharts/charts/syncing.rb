# frozen_string_literal: true

module ApexCharts
  class SyncingCharts
    def initialize(bindings, options={}, &block)
      @bindings = bindings
      @html = ''
      build_instance_variables
      @options = options
      @options[:group] ||= apexcharts_group

      instance_eval &block

      @options[:annotations] = @annotations if @annotations
    end

    def line_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        LineChart.new(bindings, data, @options.merge(options), &block).render
    end

    def area_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        AreaChart.new(bindings, data, @options.merge(options), &block).render
    end

    def bar_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        BarChart.new(bindings, data, @options.merge(options), &block).render
    end

    def column_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        ColumnChart.new(bindings, data, @options.merge(options), &block).render
    end

    def scatter_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      bindings = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        ScatterChart.new(bindings, data, @options.merge(options), &block).render
    end

    def mixed_charts(options={}, &block)
      options[:id] = apexcharts_id
      bindings = eval('self', block.binding, __FILE__, __LINE__)
      @html +=
        MixedCharts.new(bindings, @options.merge(options), &block).render
    end
    alias_method :combo_charts, :mixed_charts

    def render
      @html
    end

    def method_missing(method, *args, &block)
      if @bindings.respond_to? method, *args
        @bindings.send method, *args, &block
      else
        super
      end
    end

    def respond_to_missing?(method, *args)
      @bindings.respond_to? method, *args || super
    end

  private

    def build_instance_variables
      (@bindings.instance_variables - instance_variables).each do |i|
        instance_variable_set(i, @bindings.instance_variable_get(i))
      end
    end
  end
end
