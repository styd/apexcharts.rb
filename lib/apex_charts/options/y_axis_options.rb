# frozen_string_literal: true

require_relative 'axis_options'

module ApexCharts::Options
  class YAxisOptions < AxisOptions
    optional *%i[
      decimalsInFloat
      forceNiceScale
      logarithmic
      opposite
      reversed
      seriesName
      show
      showAlways
    ]
  end
end
