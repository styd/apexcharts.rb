module ApexCharts::Options
  module Default
    class LegendOptions < ::SmartKv
      optional *%i[
        containerMargin
        customLegendItems
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
end
