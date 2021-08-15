# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class FillOptions < Schema
      define do
        optional(:colors) { array? }
        optional(:gradient).hash do
          optional(:gradientToColors) { array? & each { str? } }
          optional(:inverseColors) { bool? }
          optional(:opacityFrom) { int? | float? }
          optional(:opacityTo) { int? | float? }
          optional(:shade) { str? }
          optional(:shadeIntensity) { int? | float? }
          optional(:stops) { array? & each { int? | float? } }
          optional(:type) { str? }
        end
        optional(:image).hash do
          optional(:src) { str? | (array? & each { str? }) }
          optional(:width) { int? | float? }
          optional(:height) { int? | float? }
        end
        optional(:opacity) { int? | float? | (array? & each { str? }) }
        optional(:pattern).hash do
          optional(:height) { int? | float? }
          optional(:strokeWidth) { int? | float? }
          optional(:style) { str? | (array? & each { str? }) }
          optional(:width) { int? | float? }
        end
        optional(:type) { str? | (array? & each { str? }) }
      end
    end
  end
end
