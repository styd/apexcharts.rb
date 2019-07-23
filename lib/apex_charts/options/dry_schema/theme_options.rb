# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class ThemeOptions < Schema
      define do
        optional(:mode)
        optional(:monochrome)
        optional(:palette)
      end
    end
  end
end
