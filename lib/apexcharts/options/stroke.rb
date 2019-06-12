module Apexcharts
  class StrokeOptions < ::SmartKv
    optional *%i[
                  colors
                  curve
                  dash_array  dashArray
                  line_cap    lineCap
                  show
                  width
                ]
  end
end
