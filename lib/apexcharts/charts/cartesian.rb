require_relative 'features/annotations'

module Apexcharts
  class CartesianChart
    include Annotations

    def initialize data, options={}, &block
      options = {**options, **more_options}
      instance_eval &block if block_given?

      options[:annotations] = @annotations if @annotations
      @series = sanitize_data(data)
      @options = Utils::Hash.camelize_keys(
                   Utils::Hash.deep_merge(
                     build_options(@series[:series][0][:data][0][:x], options),
                     {**@series, chart: {type: chart_type}}.compact
                   )
                 )

      get_selection_range if brush?
    end

    def chart_type
    end

    def more_options
      {}
    end

    def mixed_series
      @series[:series].each{|d| d.merge!(type: chart_type) }
      @series[:series]
    end

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

  private

    def sanitize_data(data)
      Apexcharts::CartesianSeries.new(data).sanitized
    end

    def build_options(x_sample, options)
      Apexcharts::OptionsBuilder.new(x_sample, options).built
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

