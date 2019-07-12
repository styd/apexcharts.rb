require 'json' unless defined? JSON

class Apexcharts::Renderer
  def self.render_default(options)
    attributes = options.delete(:div) { {} }
    variable = attributes.delete(:var) { "chart#{attributes[:id]&.[](/\d+/)}" }
    element_id = attributes.delete(:id)
    css_class = attributes.delete(:class)
    height = "#{options[:chart][:height].to_i}px"
    style = "height: #{height}; #{attributes.delete(:style)}"
    html =<<~HTML
      <div id="#{element_id}" class="#{css_class}" style="#{style}"></div>
      <script type="text/javascript">
        var #{variable} = new ApexCharts(document.querySelector("##{element_id}"), #{options.to_json});
        #{variable}.render();
      </script>
    HTML
  end
end
