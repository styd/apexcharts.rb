# frozen_string_literal: true

require_relative 'schema'
require_relative 'helper_options'
require_relative 'chart_options'
require_relative 'stroke_options'
require_relative 'states_options'

module ApexCharts::Options
  module DrySchema
    class RootOptions < Schema
      define do
        optional(:annotations)
        optional(:chart)
        optional(:colors)
        optional(:dataLabels)
        optional(:fill)
        optional(:grid)
        optional(:labels)
        optional(:legend)
        optional(:markers)
        optional(:noData)
        optional(:plotOptions)
        optional(:responsive)
        optional(:series)
        optional(:states)
        optional(:stroke)
        optional(:subtitle)
        optional(:theme)
        optional(:title)
        optional(:tooltip)
        optional(:xaxis)
        optional(:yaxis)

        (HelperOptions.keys + ChartOptions.keys +
         StrokeOptions.keys + StatesOptions.keys).each do |key|
          optional(key)
        end
      end
    end
  end
end
