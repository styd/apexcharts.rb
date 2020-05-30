# frozen_string_literal: true

require 'json'
require_relative 'version'

module ApexCharts
  class Renderer
    class << self
      def render_default(options)
        renderer = new options

        html = if renderer.id_number == '1' && !ApexCharts.config.default_options.empty?
                 renderer.window_apex
               else
                 ''
               end
        html_chart_rendering = <<~createJSChart
        // ApexCharts.RB #{RELEASE}
        var #{renderer.variable} = new ApexCharts(document.querySelector("##{renderer.element_id}"), #{substitute_function_object(renderer.options.to_json)});
        #{renderer.variable}.render();
        createJSChart

        div = <<~JS
          <div id="#{renderer.element_id}" class="#{renderer.css_class}" style="#{renderer.style}"></div>
        JS
        js = if renderer.options[:defer]
               deferred_js(html_chart_rendering)
             else
               non_deferred_js(html_chart_rendering)
             end
        html + div + js
      end

      def deferred_js(html_chart_rendering)
        js = <<~JS
        <script type="text/javascript">
          (function() {
            var createChart = function() { #{html_chart_rendering} };
            if (window.addEventListener) {
              window.addEventListener("load", createChart, true);
            } else if (window.attachEvent) {
              window.attachEvent("onload", createChart);
            } else {
              createChart();
            }
          })();
        </script>
        JS
      end

      def non_deferred_js(html_chart_rendering)
        js = <<~JS
        <script type="text/javascript">
            #{html_chart_rendering}
        </script>
        JS
      end

      def substitute_function_object(json)
        json.gsub(%r[{"function":{"args":"(?<args>.*?)","body":"(?<body>.*?)"}}]) do
          body = "\"#{$~&.[](:body)}\"".undump
          "function(#{$~&.[](:args)}){#{body}}"
        end
      end
    end

    attr_reader :options

    def initialize(options)
      @options = options
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
      <<~HTML
        <script type="text/javascript">
          window.Apex = #{ApexCharts.config.default_options.to_json}
        </script>
      HTML
    end
  end
end
