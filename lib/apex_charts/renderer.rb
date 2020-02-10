# frozen_string_literal: true

require 'json'

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
        html + <<~HTML
          <div id="#{renderer.element_id}" class="#{renderer.css_class}" style="#{renderer.style}"></div>
          <script type="text/javascript">
            var #{renderer.variable} = new ApexCharts(document.querySelector("##{renderer.element_id}"), #{renderer.options.to_json});
            #{renderer.variable}.render();
          </script>
        HTML
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
