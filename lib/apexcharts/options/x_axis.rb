require_relative 'axis'

module Apexcharts
  class XAxisOptions < AxisOptions
    optional *%i[
                  categories
                  position
                  range
                  tick_placement  tickPlacement
                ]
  end
end
