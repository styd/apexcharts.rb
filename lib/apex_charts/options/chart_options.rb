# frozen_string_literal: true

module ApexCharts::Options
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
