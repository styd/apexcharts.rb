# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class PlotOptions < Schema
      define do
        optional(:area)
        optional(:bar)
        optional(:bubble)
        optional(:candlestick)
        optional(:heatmap)
        optional(:pie)
        optional(:polarArea)
        optional(:radar)
        optional(:radialBar)
        optional(:treemap)
      end
    end
  end
end
