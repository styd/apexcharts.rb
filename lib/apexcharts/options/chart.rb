module ApexCharts
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
                  height
                  id
                  locales
                  parentHeightOffset
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
