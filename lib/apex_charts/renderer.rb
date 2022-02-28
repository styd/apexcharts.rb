# frozen_string_literal: true

require 'json'
require_relative 'version'

module ApexCharts
  class Renderer
    class << self
      def render(options)
        new(options).render
      end
    end

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def render
      html = ''
      html = window_apex if id_number == '1' && !ApexCharts.config.default_options.empty?

      chart_rendering = <<~JS
        var #{variable} = new ApexCharts(document.querySelector("##{element_id}"), #{substitute_function_object(options.to_json)});
        #{variable}.render();
      JS

      html += <<~HTML
        <div id="#{element_id}" class="#{css_class}" style="#{style}"></div>
        #{script(defer(chart_rendering))}
      HTML
    end

    def defer(js)
      if defer?
        <<~DEFERRED
          (function() {
            var createChart = function() {
              #{indent(js)}
            };
            if (window.addEventListener) {
              window.addEventListener("load", createChart, true);
            } else if (window.attachEvent) {
              window.attachEvent("onload", createChart);
            } else {
              createChart();
            }
          })();
        DEFERRED
      else
        js
      end
    end

    def substitute_function_object(json)
      json.gsub(/{"function":{"args":"(?<args>.*?)","body":"(?<body>.*?)"}}/) do
        body = "\"#{$LAST_MATCH_INFO&.[](:body)}\"".undump
        "function(#{$LAST_MATCH_INFO&.[](:args)}){#{body}}"
      end
    end

    def defer?
      @defer ||= options.delete(:defer)
    end

    def module?
      @module ||= options.delete(:module)
    end

    def attributes
      @attributes ||= options.delete(:div) { {} }
    end

    def element_id
      @element_id ||= attributes.delete(:id)
    end

    def id_number
      @id_number ||= element_id&.[](/\d+/)
    end

    def variable
      @variable ||= attributes.delete(:var) { "chart#{id_number}" }
    end

    def css_class
      attributes.delete(:class)
    end

    def height
      "#{options[:chart][:height].to_i}px"
    end

    def style
      "height: #{height}; #{attributes.delete(:style)}"
    end

    def window_apex
      script("window.Apex = #{ApexCharts.config.default_options.to_json}")
    end

    def script(js)
      type = module? ? 'module' : 'text/javascript'
      <<~SCRIPT
        <script type="#{type}" apexcharts-rb="#{RELEASE}" >
        #{js}
        </script>
      SCRIPT
    end

    def indent(content, times=2)
      content.lines.map.with_index do |line, index|
        (index.zero? ? '' : '  ' * times) + line
      end.join
    end
  end
end
