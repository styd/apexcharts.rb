# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class YAxisOptions < Schema
      define do
        optional(:axisBorder)
        optional(:axisTicks)
        optional(:crosshairs)
        optional(:decimalsInFloat)
        optional(:floating)
        optional(:forceNiceScale)
        optional(:labels)
        optional(:logarithmic)
        optional(:max)
        optional(:min)
        optional(:opposite)
        optional(:reversed)
        optional(:seriesName)
        optional(:show)
        optional(:showAlways)
        optional(:showForNullSeries)
        optional(:tickAmount)
        optional(:title)
        optional(:tooltip)
        optional(:type)
      end
    end
  end
end
