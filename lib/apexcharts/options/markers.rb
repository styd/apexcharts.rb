module Apexcharts
  class MarkersOptions < ::SmartKv
    optional *%i[
                  colors
                  discrete
                  fill_opacity    fillOpacity
                  hover
                  offset_x        offsetX
                  offset_y        offsetY
                  radius
                  shape
                  size
                  stroke_color    strokeColor
                  stroke_opacity  strokeOpacity
                  stroke_width    strokeWidth
                ]
  end
end
