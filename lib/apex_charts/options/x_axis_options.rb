# frozen_string_literal: true

require_relative 'axis_options'

module ApexCharts::Options
  class XAxisOptions < AxisOptions
    optional *%i[
      categories
      position
      range
      tickPlacement
    ]
  end
end
