# frozen_string_literal: true

module ApexCharts::Options
  class MarkersOptions < ::SmartKv
    optional *%i[
      colors
      discrete
      fillOpacity
      hover
      offsetX
      offsetY
      radius
      shape
      size
      strokeColor
      strokeOpacity
      strokeWidth
    ]
  end
end
