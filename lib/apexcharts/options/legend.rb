module Apexcharts
  class LegendOptions < ::SmartKv
    optional *%i[
                  container_margin        containerMargin
                  floating
                  font_family             fontFamily
                  font_size               fontSize
                  formatter
                  horizontal_align        horizontalAlign
                  item_margin             itemMargin
                  labels
                  markers
                  offset_x                offsetX
                  offset_y                offsetY
                  on_item_click           onItemClick
                  on_item_hover           onItemHover
                  position
                  show
                  show_for_single_series  showForSingleSeries
                  text_anchor             textAnchor
                  vertical_align          verticalAlign
                ]
  end
end
