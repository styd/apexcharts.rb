# frozen_string_literal: true

require_relative 'axis_options'

module ApexCharts::Options
  class YAxisOptions < ::SmartKv
    optional *%i[
      axisBorder
      axisTicks
      crosshairs
      decimalsInFloat
      floating
      forceNiceScale
      labels
      logarithmic
      max
      min
      opposite
      reversed
      seriesName
      show
      showAlways
      showForNullSeries
      tickAmount
      title
      tooltip
      type
    ]
  end
end
