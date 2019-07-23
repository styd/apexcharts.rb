# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class DataLabelsOptions < Schema
      define do
        optional(:background)
        optional(:distributed)
        optional(:dropShadow)
        optional(:enabled)
        optional(:enabledOnSeries)
        optional(:formatter)
        optional(:offsetX)
        optional(:offsetY)
        optional(:style)
        optional(:textAnchor)
      end
    end
  end
end
