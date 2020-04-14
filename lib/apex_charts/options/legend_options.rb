# frozen_string_literal: true

module ApexCharts::Options
  class LegendOptions < ::SmartKv
    optional *%i[
      containerMargin
      floating
      fontFamily
      fontSize
      fontWeight
      formatter
      height
      horizontalAlign
      inverseOrder
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
      tooltipHoverFormatter
      width
    ]
  end
end
