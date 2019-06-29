module Apexcharts
  class MixedChart
    include Annotations

    def initialize bindings, options={}, &block
      @bindings = bindings
      @series = {series: []}
      options[:id] ||= apexcharts_id
      build_instance_variables

      instance_eval &block

      options[:annotations] = @annotations if @annotations
      @options = Utils::Hash.camelize_keys(
                   Utils::Hash.deep_merge(
                     build_options(@series[:series][0][:data][0][:x], options),
                     {chart: {type: 'area'}, **@series}
                   )
                 )

      get_selection_range if brush?
    end

    def line_chart data, options={}, &block
      bindings = eval("self", block.binding) if block_given?
      @series[:series] += LineChart.new(bindings, data, options, &block).mixed_series
    end

    def area_chart data, options={}, &block
      bindings = eval("self", block.binding) if block_given?
      @series[:series] += AreaChart.new(bindings, data, options, &block).mixed_series
    end

    def bar_chart data, options={}, &block
      bindings = eval("self", block.binding) if block_given?
      @series[:series] += BarChart.new(bindings, data, options, &block).mixed_series
    end

    def column_chart data, options={}, &block
      bindings = eval("self", block.binding) if block_given?
      @series[:series] += ColumnChart.new(bindings, data, options, &block).mixed_series
    end

    def scatter_chart data, options={}, &block
      bindings = eval("self", block.binding) if block_given?
      @series[:series] += ScatterChart.new(bindings, data, options, &block).mixed_series
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
      Apexcharts::OptionsBuilder.new(x_sample, options).build_options
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
