require_relative 'axis'

module Apexcharts
  class YAxisOptions < AxisOptions
    optional *%i[
                  decimals_in_float  decimalsInFloat
                  force_nice_scale   forceNiceScale
                  logarithmic
                  opposite
                  series_name        seriesName
                  show
                  show_always        showAlways
                ]
  end
end
