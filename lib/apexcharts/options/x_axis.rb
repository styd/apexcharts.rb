require_relative 'axis'

module Apexcharts
  class XAxisOptions < AxisOptions
    optional *%i[
                  categories
                  position
                  range
                  tickPlacement
                ]
  end
end
