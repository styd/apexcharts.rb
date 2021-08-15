module ApexCharts::Options
  module Default
    class MarkersOptions < ::SmartKv
      optional *%i[
        colors
        discrete
        fillOpacity
        height
        hover
        offsetX
        offsetY
        onClick
        onDblClick
        radius
        shape
        showNullDataPoints
        size
        strokeColors
        strokeDashArray
        strokeOpacity
        strokeWidth
        width
      ]
    end
  end
end
