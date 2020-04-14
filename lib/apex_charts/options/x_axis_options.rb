# frozen_string_literal: true

require_relative 'axis_options'

module ApexCharts::Options
  class XAxisOptions < ::SmartKv
    optional *%i[
      axisBorder
      axisTicks
      categories
      crosshairs
      floating
      labels
      max
      min
      position
      range
      tickAmount
      tickPlacement
      title
      tooltip
      type
      offsetX
      offsetY
      sorted
    ]
  end
end
