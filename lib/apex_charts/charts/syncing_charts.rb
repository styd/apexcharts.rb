# frozen_string_literal: true

module ApexCharts::Charts
  class SyncingCharts
    def initialize(outer_self, options={}, &block)
      @outer_self = outer_self
      @html = ''
      build_instance_variables
      @options = options
      @options[:group] ||= apexcharts_group

      instance_eval &block

      @options[:annotations] = @annotations if @annotations
    end

    def line_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        LineChart.new(outer_self, data, @options.merge(options), &block).render
    end

    def area_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        AreaChart.new(outer_self, data, @options.merge(options), &block).render
    end

    def bar_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        BarChart.new(outer_self, data, @options.merge(options), &block).render
    end

    def column_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        ColumnChart.new(outer_self, data, @options.merge(options), &block).render
    end

    def scatter_chart(data, options={}, &block)
      options[:id] = apexcharts_id
      outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
      @html +=
        ScatterChart.new(outer_self, data, @options.merge(options), &block).render
    end

    def mixed_charts(options={}, &block)
      options[:id] = apexcharts_id
      outer_self = eval('self', block.binding, __FILE__, __LINE__)
      @html +=
        MixedCharts.new(outer_self, @options.merge(options), &block).render
    end
    alias_method :combo_charts, :mixed_charts

    def render
      @html
    end

    def method_missing(method, *args, &block)
      if @outer_self.respond_to?(method, true)
        @outer_self.send method, *args, &block
      else
        super
      end
    end

    def respond_to_missing?(method, *args)
      @outer_self.respond_to? method, *args || super
    end

  private

    def build_instance_variables
      (@outer_self.instance_variables - instance_variables).each do |i|
        instance_variable_set(i, @outer_self.instance_variable_get(i))
      end
    end
  end
end
