require_relative 'axis'

module ApexCharts
  class YAxisOptions < AxisOptions
    optional *%i[
      decimalsInFloat
      forceNiceScale
      logarithmic
      opposite
      seriesName
      show
      showAlways
    ]
  end
end
