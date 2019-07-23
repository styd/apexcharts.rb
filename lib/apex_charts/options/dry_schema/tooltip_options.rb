# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class TooltipOptions < Schema
      define do
        optional(:custom)
        optional(:enabled)
        optional(:enabledOnSeries)
        optional(:fillSeriesColor)
        optional(:fixed)
        optional(:followCursor)
        optional(:intersect)
        optional(:inverseOrder)
        optional(:items)
        optional(:marker)
        optional(:onDatasetHover)
        optional(:shared)
        optional(:style)
        optional(:theme)
        optional(:x)
        optional(:y)
        optional(:z)
      end
    end
  end
end
