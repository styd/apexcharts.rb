require_relative 'axis'

module ApexCharts
  class XAxisOptions < AxisOptions
    optional *%i[
                  categories
                  position
                  range
                  tickPlacement
                ]
  end
end
