# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class GridOptions < Schema
      define do
        optional(:borderColor)
        optional(:column)
        optional(:padding)
        optional(:position)
        optional(:row)
        optional(:show)
        optional(:strokeDashArray)
        optional(:xaxis)
        optional(:yaxis)
      end
    end
  end
end
