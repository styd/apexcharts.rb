module Apexcharts
  class BaseChart
    def render
      attributes = @options.delete(:div) { {} }
      variable = attributes.delete(:var) { "chart#{attributes[:id]&.[](/\d+/)}" }
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

  protected

    def build_options(x_sample, options)
      Apexcharts::OptionsBuilder.new(x_sample, options).build_options
    end

    def x_sample
      @series[:series][0][:data][0][:x]
    end
  end
end


