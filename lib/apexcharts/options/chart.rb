module Apexcharts
  class ChartOptions < ::SmartKv
    optional *%i[ animations
                  background
                  brush
                  default_locale  defaultLocale
                  drop_shadow     dropShadow
                  events
                  font_family     fontFamily
                  fore_color      foreColor
                  height
                  id
                  locales
                  selection
                  sparkline
                  stack_type      stackType
                  stacked
                  toolbar
                  type
                  width
                  zoom
                ]
  end
end
