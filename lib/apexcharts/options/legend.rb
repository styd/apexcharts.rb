module ApexCharts
  class LegendOptions < ::SmartKv
    optional *%i[
      show
      showForSingleSeries
      showForNullSeries
      showForZeroSeries
      position
      horizontalAlign
      floating
      fontSize
      fontFamily
      width
      height
      formatter
      offsetX
      offsetY
      labels
      markers
      itemMargin
      onItemClick
      onItemHover
    ]
  end
end
