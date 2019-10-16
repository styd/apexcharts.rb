require_relative 'axis'

module ApexCharts
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
