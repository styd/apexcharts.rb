module Apexcharts
  class PolarChart
    def initialize data, options={}
      @series = sanitize_data(data)
      @options = Utils::Hash.camelize_keys(
                   Utils::Hash.deep_merge(
                     build_options(options),
                     {**@series, chart: {type: chart_type}}.compact
                   )
                 )
    end

    def chart_type
    end

    def render
      attributes = @options.delete(:div)
      variable = attributes.delete(:var) || "chart#{attributes[:id][/\d+/]}"
      element_id = attributes.delete(:id)
      css_class = attributes.delete(:class)
      height = "#{@options[:chart][:height].to_i}px"
      style = "height: #{height}; #{attributes.delete(:style)}"
      html =<<~HTML
        <div id="#{element_id}" class="#{css_class}" style="#{style}"></div>
        <script type="text/javascript">
          var #{variable} = new ApexCharts(document.querySelector("##{element_id}"), #{@options.to_json});
          #{variable}.render();
        </script>
      HTML
    end

  private

    def sanitize_data(data)
      Apexcharts::PolarSeries.new(data).sanitized
    end

    def build_options(options)
      Apexcharts::OptionsBuilder.new(nil, options).built
    end
  end
end

