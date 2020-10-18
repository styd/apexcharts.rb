# frozen_string_literal: true

require_relative 'annotation_label'

module ApexCharts::Options
  module DrySchema
    XAxisAnnotations = ::Dry::Schema.Params do
      optional(:borderColor) { str? }
      optional(:borderWidth) { int? | float? }
      optional(:fillColor) { str? }
      optional(:label).hash(AnnotationLabel)
      optional(:offsetX) { int? | float? }
      optional(:offsetY) { int? | float? }
      optional(:opacity) { int? | float? }
      optional(:strokeDashArray) { int? | float? }
      optional(:x) { filled? > int? | float? | str? }
      optional(:x2) { filled? > int? | float? | str? }
    end
  end
end
