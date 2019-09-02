module ApexCharts
  class LegendOptions < ::SmartKv
    optional *%i[
      show
      showForSingleSeries
      showForNullSeries
      showForZeroSeries
      floating
      position
      horizontalAlign
      fontSize
      fontFamily
      width
      height
      offsetX
      offsetY
      formatter
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
