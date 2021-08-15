# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class ThemeOptions < Schema
      define do
        optional(:mode).value(included_in?: %w[light dark])
        optional(:monochrome).hash do
          optional(:enabled) { bool? }
          optional(:color) { str? }
          optional(:shadeTo).value(included_in?: %w[light dark])
          optional(:shadeIntensity) { int? | float? }
        end
        optional(:palette) { str? }
      end
    end
  end
end
