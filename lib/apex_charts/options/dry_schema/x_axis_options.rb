# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class XAxisOptions < Schema
      define do
        optional(:axisBorder)
        optional(:axisTicks)
        optional(:categories)
        optional(:overwriteCategories)
        optional(:crosshairs)
        optional(:floating)
        optional(:decimalsInFloat)
        optional(:labels)
        optional(:max)
        optional(:min)
        optional(:position)
        optional(:range)
        optional(:tickAmount)
        optional(:tickPlacement)
        optional(:title)
        optional(:tooltip)
        optional(:type)
        optional(:offsetX)
        optional(:offsetY)
        optional(:sorted)
      end
    end
  end
end
