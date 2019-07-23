module ApexCharts::Options
  module Default
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
        strokeColors
        strokeOpacity
        strokeWidth
        strokeDashArray
        showNullDataPoints
        onClick
        onDblClick
      ]
    end
  end
end
