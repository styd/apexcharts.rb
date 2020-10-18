# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    AnnotationLabel = ::Dry::Schema.Params do
      optional(:backgroundColor) { str? }
      optional(:borderColor) { str? }
      optional(:borderRadius) { int? | float? }
      optional(:borderWidth) { int? | float? }
      optional(:fontFamily) { filled? > str? }
      optional(:fontSize) { str? | int? | float? }
      optional(:fontWeight) { str? | int? | float? }
      optional(:foreColor) { str? }
      optional(:paddingBottom) { int? | float? }
      optional(:paddingLeft) { int? | float? }
      optional(:paddingRight) { int? | float? }
      optional(:paddingTop) { int? | float? }
      optional(:text) { str? }
      optional(:textAnchor) { str? }
      optional(:x) { int? | float? }
      optional(:y) { int? | float? }
    end
  end
end
