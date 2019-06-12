module Apexcharts
  class MixedChart
    include Annotations

    def initialize options={}, bindings, &block
      @bindings = bindings
      @mixed_series = []
      build_instance_variables
      instance_eval &block

      options[:annotations] = @annotations if @annotations
      @options = Utils::Hash.camelize_keys(
                   Utils::Hash.deep_merge(
                     build_options(@mixed_series[0][:data][0][:x], options),
                     {chart: {type: 'area'}, series: @mixed_series}
                   )
                 )
    end

    def line_chart data, options={}, &block
      @mixed_series += LineChart.new(data, options, &block).mixed_series
    end

    def area_chart data, options={}, &block
      @mixed_series += AreaChart.new(data, options, &block).mixed_series
    end

    def bar_chart data, options={}, &block
      @mixed_series += BarChart.new(data, options, &block).mixed_series
    end

    def column_chart data, options={}, &block
      @mixed_series += ColumnChart.new(data, options, &block).mixed_series
    end

    def scatter_chart data, options={}, &block
      @mixed_series += ScatterChart.new(data, options, &block).mixed_series
    end

    def render
      attributes = @options.delete(:div)
      variable = attributes.delete(:var) || "chart#{attributes[:id][/\d+/]}"
      element_id = attributes.delete(:id)
      css_class = attributes.delete(:class)
      height = "#{@options[:chart][:height].to_i}px"
      style = "height: #{height};#{attributes.delete(:style)}"
      html =<<~HTML
        <div id="#{element_id}" class="#{css_class}" style="#{style}"></div>
        <script type="text/javascript">
          var #{variable} = new ApexCharts(document.querySelector("##{element_id}"), #{@options.to_json});
          #{variable}.render();
        </script>
      HTML
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

    def build_options(x_sample, options)
      Apexcharts::OptionsBuilder.new(x_sample, options).built
    end
  end
end
