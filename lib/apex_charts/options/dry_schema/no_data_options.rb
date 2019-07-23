# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class NoDataOptions < Schema
      define do
        optional(:align)
        optional(:offsetX)
        optional(:offsetY)
        optional(:style)
        optional(:text)
        optional(:verticalAlign)
      end
    end
  end
end
