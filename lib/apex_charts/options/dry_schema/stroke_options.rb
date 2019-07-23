# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class StrokeOptions < Schema
      define do
        optional(:colors)
        optional(:curve)
        optional(:dashArray)
        optional(:lineCap)
        optional(:show)
        optional(:width)
      end
    end
  end
end
