require_relative 'axis'

module Apexcharts
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
