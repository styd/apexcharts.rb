module Apexcharts
  class AxisOptions < ::SmartKv
    optional *%i[
                  axis_border  axisBorder
                  axis_ticks   axisTicks
                  crosshairs
                  floating
                  labels
                  max
                  min
                  tick_amount  tickAmount
                  title
                  tooltip
                  type
                ]
  end
end
