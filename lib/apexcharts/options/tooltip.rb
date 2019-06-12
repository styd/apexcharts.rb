module Apexcharts
  class TooltipOptions < ::SmartKv
    optional *%i[
                  custom
                  enabled
                  fill_series_color  fillSeriesColor
                  fixed
                  follow_cursor      followCursor
                  intersect
                  inverse_order      inverseOrder
                  items
                  marker
                  on_dataset_hover   onDatasetHover
                  shared
                  style
                  theme
                  x
                  y
                  z
                ]
  end
end
