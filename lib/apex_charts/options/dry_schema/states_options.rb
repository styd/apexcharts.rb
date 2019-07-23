# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class StatesOptions < Schema
      define do
        optional(:active)
        optional(:hover)
        optional(:normal)
      end
    end
  end
end
