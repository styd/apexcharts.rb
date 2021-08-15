module ApexCharts::Options
  module Default
    class ChartOptions < ::SmartKv
      optional *%i[
        animations
        background
        brush
        defaultLocale
        dropShadow
        events
        fontFamily
        foreColor
        group
        height
        id
        locales
        offsetX
        offsetY
        parentHeightOffset
        redrawOnParentResize
        redrawOnWindowResize
        selection
        sparkline
        stackType
        stacked
        toolbar
        type
        width
        zoom
      ]
    end
  end
end
