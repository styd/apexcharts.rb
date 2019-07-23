# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class AnnotationsOptions < Schema
      define do
        optional(:images)
        optional(:points)
        optional(:position)
        optional(:texts)
        optional(:xaxis)
        optional(:yaxis)
      end
    end
  end
end
