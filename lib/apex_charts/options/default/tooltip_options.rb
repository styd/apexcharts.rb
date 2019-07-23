module ApexCharts::Options
  module Default
    class TooltipOptions < ::SmartKv
      optional *%i[
        custom
        enabled
        enabledOnSeries
        fillSeriesColor
        fixed
        followCursor
        intersect
        inverseOrder
        items
        marker
        onDatasetHover
        shared
        style
        theme
        x
        y
        z
      ]
    end
  end
end
