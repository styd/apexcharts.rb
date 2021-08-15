# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class StrokeOptions < Schema
      define do
        optional(:colors) { array? & each { str? } }
        optional(:curve) {
          included_in?(%w[smooth straight stepline]) |
            (array? & each {
              included_in? %w[smooth straight stepline]
            })
        }
        optional(:dashArray) { int? | float? | (array? & each { int? | float? }) }
        optional(:lineCap) { included_in? %w[butt square round] }
        optional(:show) { bool? }
        optional(:width) { int? | float? | (array? & each { int? | float? }) }
      end
    end
  end
end
