module ApexCharts
  class LegendOptions < ::SmartKv
    optional *%i[
      show
      showForSingleSeries
      showForNullSeries
      showForZeroSeries
      floating
      inverseOrder
      position
      horizontalAlign
      fontSize
      fontFamily
      width
      height
      offsetX
      offsetY
      formatter
      tooltipHoverFormatter
      textAnchor
      labels
      markers
      itemMargin
      containerMargin
      onItemClick
      onItemHover
    ]
  end
end
