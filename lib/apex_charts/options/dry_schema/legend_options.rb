# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class LegendOptions < Schema
      define do
        optional(:containerMargin)
        optional(:floating)
        optional(:fontFamily)
        optional(:fontSize)
        optional(:fontWeight)
        optional(:formatter)
        optional(:height)
        optional(:horizontalAlign)
        optional(:inverseOrder)
        optional(:itemMargin)
        optional(:labels)
        optional(:markers)
        optional(:offsetX)
        optional(:offsetY)
        optional(:onItemClick)
        optional(:onItemHover)
        optional(:position)
        optional(:show)
        optional(:showForNullSeries)
        optional(:showForSingleSeries)
        optional(:showForZeroSeries)
        optional(:textAnchor)
        optional(:tooltipHoverFormatter)
        optional(:width)
      end
    end
  end
end
