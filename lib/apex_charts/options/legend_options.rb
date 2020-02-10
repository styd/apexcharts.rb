# frozen_string_literal: true

module ApexCharts::Options
  class LegendOptions < ::SmartKv
    optional *%i[
      containerMargin
      floating
      fontFamily
      fontSize
      formatter
      height
      horizontalAlign
      itemMargin
      labels
      markers
      offsetX
      offsetY
      onItemClick
      onItemHover
      position
      show
      showForNullSeries
      showForSingleSeries
      showForZeroSeries
      textAnchor
      width
    ]
  end
end
