module ApexCharts::Options
  module Default
    class XAxisOptions < ::SmartKv
      optional *%i[
        axisBorder
        axisTicks
        categories
        crosshairs
        floating
        labels
        max
        min
        offsetX
        offsetY
        overwriteCategories
        position
        range
        sorted
        tickAmount
        tickPlacement
        title
        tooltip
        type
      ]
    end
  end
end
