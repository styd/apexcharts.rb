# frozen_string_literal: true

module ApexCharts::Options
  class AxisOptions < ::SmartKv
    optional *%i[
      axisBorder
      axisTicks
      crosshairs
      floating
      labels
      max
      min
      tickAmount
      title
      tooltip
      type
    ]
  end
end
