# frozen_string_literal: true

require_relative 'annotation_label'

module ApexCharts::Options
  module DrySchema
    PointAnnotations = ::Dry::Schema.Params do
      optional(:x) { int? | float? | str? }
      optional(:y) { filled? > int? | float? }
      optional(:yAxisIndex) { int? | float? }
      optional(:seriesIndex) { int? | float? }
      optional(:marker).hash do
        optional(:size) { int? | float? }
        optional(:fillColor) { str? }
        optional(:strokeColor) { str? }
        optional(:strokeWidth) { int? | float? }
        optional(:shape) { str? }
        optional(:offsetX) { int? | float? }
        optional(:offsetY) { int? | float? }
        optional(:radius) { int? | float? }
        optional(:cssClass) { str? }
      end
      optional(:label).hash(AnnotationLabel)
      optional(:image).hash do
        optional(:height) { int? | float? }
        optional(:offsetX) { int? | float? }
        optional(:offsetY) { int? | float? }
        optional(:path) { str? }
        optional(:width) { int? | float? }
      end
    end
  end
end
