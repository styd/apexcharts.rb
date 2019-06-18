require_relative 'capabilities/annotations'

module Apexcharts
  class CartesianChart
    include Annotations

    def initialize data, options={}, &block
      options = {**options, **plot_options}
      instance_eval &block if block_given?

      options[:annotations] = @annotations if @annotations
      @series = sanitize_data(data)
      @options = Utils::Hash.camelize_keys(
                   Utils::Hash.deep_merge(
                     build_options(@series[:series][0][:data][0][:x], options),
                     {**@series, chart: {type: chart_type}}.compact
                   )
                 )
    end

    def chart_type
    end

    def plot_options
      {}
    end

    def mixed_series
      @series[:series].each{|d| d.merge!(type: chart_type) }
      @series[:series]
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
      Apexcharts::CartesianSeries.new(data).sanitized
    end

    def build_options(x_sample, options)
      Apexcharts::OptionsBuilder.new(x_sample, options).built
    end
  end
end

